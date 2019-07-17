
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Request;

@Repository
public interface RequestRepository extends JpaRepository<Request, Integer> {

	@Query("select r from Request r join r.parade p where p.brotherhood.id = ?1 order by r.status")
	Collection<Request> findRequestByBrotherhood(int brotherhoodId);

	@Query("select r from Request r where r.member.id = ?1 order by r.status")
	Collection<Request> findRequestByMember(int memberId);
}
