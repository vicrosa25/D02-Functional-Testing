
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Segment extends DomainEntity {

	// Attributes -------------------------------------------------------------
	private Coordinates	origin;
	private Coordinates	destination;
	private Date		originTime;
	private Date		destinationTime;


	@Valid
	public Coordinates getOrigin() {
		return this.origin;
	}
	public void setOrigin(final Coordinates origin) {
		this.origin = origin;
	}

	@Valid
	public Coordinates getDestination() {
		return this.destination;
	}
	public void setDestination(final Coordinates destination) {
		this.destination = destination;
	}

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getOriginTime() {
		return this.originTime;
	}
	public void setOriginTime(final Date originTime) {
		this.originTime = originTime;
	}

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getDestinationTime() {
		return this.destinationTime;
	}

	public void setDestinationTime(final Date destinationTime) {
		this.destinationTime = destinationTime;
	}


	// Relationships ----------------------------------------------------------
	private Path	path;


	@NotNull
	@ManyToOne(optional = false)
	public Path getPath() {
		return this.path;
	}

	public void setPath(final Path path) {
		this.path = path;
	}
}
