
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@Access(AccessType.PROPERTY)
public class LinkRecord extends MiscellaneousRecord {

	// Attributes -------------------------------------------------------------
	private Brotherhood link;


	@OneToOne(optional = false)
	public Brotherhood getLink() {
		return this.link;
	}

	public void setLink(Brotherhood link) {
		this.link = link;
	}
}
