
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.PathRepository;
import domain.Brotherhood;
import domain.Path;
import domain.Segment;
import forms.PathForm;

@Service
@Transactional
public class PathService {

	// Manage Repository
	@Autowired
	private PathRepository		pathRepository;

	// Supporting services
	@Autowired
	private BrotherhoodService	brotherhoodService;

	@Autowired
	private SegmentService		segmentService;

	@Autowired
	@Qualifier("validator")
	private Validator			validator;


	// CRUD methods
	public Path create() {
		final Path result = new Path();
		result.setSegments(new ArrayList<Segment>());

		return result;
	}

	public Path findOne(final int pathID) {
		final Path result = this.pathRepository.findOne(pathID);
		Assert.notNull(result);

		return result;
	}

	public Collection<Path> findAll() {
		final Collection<Path> result = this.pathRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Path save(final Path path) {
		final Brotherhood principal = this.brotherhoodService.findByPrincipal();
		Assert.notNull(path);
		Assert.isTrue(principal.getProcessions().contains(path.getProcession()));

		final Path result = this.pathRepository.save(path);

		if (path.getId() == 0) {
			if (result.getProcession().getPaths() == null) {
				result.getProcession().setPaths(new ArrayList<Path>());
			}
			result.getProcession().getPaths().add(result);
		}

		return result;
	}

	public void delete(final Path path) {
		Assert.notNull(path);
		final Brotherhood principal = this.brotherhoodService.findByPrincipal();
		Assert.isTrue(principal.getProcessions().contains(path.getProcession()));

		path.getProcession().getPaths().remove(path);
		final ArrayList<Segment> segments = new ArrayList<Segment>(path.getSegments());
		for (final Segment seg : segments) {
			this.segmentService.delete(seg);
		}

		this.pathRepository.delete(path);
	}
	/*** Other methods ***/

	/*** Reconstruct object, check validity and update binding ***/
	public Path reconstruct(final PathForm form, final BindingResult binding) {
		final Path path = this.create();
		final Segment segment = this.reconstructSegment(form, binding);
		path.setProcession(form.getProcession());
		segment.setPath(path);

		this.validator.validate(segment, binding);
		return path;
	}

	public Segment reconstructSegment(final PathForm form, final BindingResult binding) {
		final Segment segment = this.segmentService.create();

		segment.setDestinationLatitude(form.getDestinationLatitude());
		segment.setDestinationLongitude(form.getDestinationLongitude());
		segment.setOriginLatitude(form.getOriginLatitude());
		segment.setOriginLongitude(form.getOriginLongitude());
		segment.setDestinationTime(form.getDestinationTime());
		segment.setOriginTime(form.getOriginTime());

		return segment;
	}

}
