package services;

import java.util.Collection;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Proclaim;
import repositories.ProclaimRepository;

@Service
@Transactional
public class ProclaimService {
	
	// Manage Repository
	private ProclaimRepository		proclaimRepository;
	
	
	// CRUD methods
	public Proclaim create() {
		Proclaim result = new Proclaim();
		
		return result;
	}
	
	
	public Proclaim findOne(int proclaimID) {
		final Proclaim result = this.proclaimRepository.findOne(proclaimID);
		Assert.notNull(result);

		return result;
	}
	
	
	public Collection<Proclaim> findAll() {
		return this.proclaimRepository.findAll();
	}
	
	
	public Proclaim save(Proclaim proclaim) {
		Assert.notNull(proclaim);
		
		return this.proclaimRepository.save(proclaim);
		
	}
	
	public void delete(Proclaim proclaim) {
		Assert.notNull(proclaim);
		Assert.isTrue(proclaim.getId() != 0);
		
		this.proclaimRepository.delete(proclaim);
	}
	
	
	// Other methods
	
	public Collection<Proclaim> findByChapter(int chapterId) {
		return this.proclaimRepository.findByCahpter(chapterId);
	}
	
	

}
