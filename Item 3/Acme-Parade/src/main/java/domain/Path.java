
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Path extends DomainEntity {

	// Relationships ----------------------------------------------------------
	private Collection<Segment>	segments;
	private Procession			procession;


	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Procession getProcession() {
		return this.procession;
	}

	public void setProcession(final Procession procession) {
		this.procession = procession;
	}

	@NotNull
	@Valid
	@OneToMany(mappedBy = "path")
	public Collection<Segment> getSegments() {
		return this.segments;
	}

	public void setSegments(final Collection<Segment> segments) {
		this.segments = segments;
	}
}
