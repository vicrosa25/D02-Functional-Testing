package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.PathRepository;
import domain.Brotherhood;
import domain.Path;
import domain.Segment;

@Service
@Transactional
public class PathService {

	// Manage Repository
	@Autowired
	private PathRepository	pathRepository;

	// Supporting services
	@Autowired
	private BrotherhoodService		brotherhoodService;


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
		boolean nuevo = false;
		Brotherhood principal = this.brotherhoodService.findByPrincipal();
		Assert.notNull(path);
		
		if(path.getId() == 0){
			nuevo = true;
		}else{
			Assert.isTrue(principal.getProcessions().contains(path.getProcession()));
		}
		
		final Path result = this.pathRepository.save(path);
		
		if(nuevo){
			result.getProcession().getPaths().add(result);
		}
		
		return result;
	}

	public void delete(final Path path) {
		Assert.notNull(path);
		final Brotherhood principal = this.brotherhoodService.findByPrincipal();
		Assert.isTrue(principal.getProcessions().contains(path.getProcession()));
		
		path.getProcession().getPaths().remove(path);

		this.pathRepository.delete(path);
	}
	/*** Other methods ***/
	
}