package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.SegmentRepository;
import domain.Brotherhood;
import domain.Segment;

@Service
@Transactional
public class SegmentService {

	// Manage Repository
	@Autowired
	private SegmentRepository	segmentRepository;

	// Supporting services
	@Autowired
	private BrotherhoodService		brotherhoodService;


	// CRUD methods
	public Segment create() {
		final Segment result = new Segment();
		
		return result;
	}

	public Segment findOne(final int segmentID) {
		final Segment result = this.segmentRepository.findOne(segmentID);
		Assert.notNull(result);

		return result;
	}

	public Collection<Segment> findAll() {
		final Collection<Segment> result = this.segmentRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Segment save(final Segment segment) {
		boolean nuevo = false;
		Brotherhood principal = this.brotherhoodService.findByPrincipal();
		Assert.notNull(segment);
		
		if(segment.getId() == 0){
			nuevo = true;
		}else{
			Assert.isTrue(principal.getProcessions().contains(segment.getPath().getProcession()));
		}
		
		final Segment result = this.segmentRepository.save(segment);
		
		if(nuevo){
			result.getPath().getSegments().add(result);
		}
		
		return result;
	}

	public void delete(final Segment segment) {
		Assert.notNull(segment);
		final Brotherhood principal = this.brotherhoodService.findByPrincipal();
		Assert.isTrue(principal.getProcessions().contains(segment.getPath().getProcession()));
		
		segment.getPath().getSegments().remove(segment);

		this.segmentRepository.delete(segment);
	}
	/*** Other methods ***/
	
}