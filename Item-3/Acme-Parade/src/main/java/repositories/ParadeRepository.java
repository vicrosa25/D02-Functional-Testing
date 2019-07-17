
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Parade;

@Repository
public interface ParadeRepository extends JpaRepository<Parade, Integer> {

	@Query("select p from Parade p where p.brotherhood.id = ?1 and p.draftMode = 'false'")
	Collection<Parade> findByBrotherhoodNotDraft(int brotherhoodId);

	@Query("select p from Parade p where p.brotherhood.id = ?1 and p.draftMode = 'false' and p.status = 'APPROVED'")
	Collection<Parade> findByBrotherhoodNotDraftAndApproved(int brotherhoodId);

	@Query("select p from Parade p where p.brotherhood.id = ?1 order by p.status")
	Collection<Parade> getParadesSortedByStatus(int brotherhoodId);

	@Query("select p from Parade p where p.status = 'APPROVED'")
	Collection<Parade> findAllAccepted();

}
