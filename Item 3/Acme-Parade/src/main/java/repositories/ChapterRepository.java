
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Chapter;



@Repository
public interface ChapterRepository extends JpaRepository<Chapter, Integer> {

	@Query("select c from Chapter c where c.id = ?1")
	Chapter findById(int id);

	@Query("select c from Chapter c where c.userAccount.username = ?1")
	Chapter findByUserName(String username);

	@Query("select c from Chapter c where c.userAccount.id = ?1")
	Chapter findByUserAccountId(int id);
}
