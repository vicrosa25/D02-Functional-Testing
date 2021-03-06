
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Brotherhood extends Actor {

	// Attributes
	private String				title;
	private Date				establishment;
	private Collection<Url>		pictures;

	// Relationships ----------------------------------------------------------
	private Collection<Enrol>	enrols;
	private Collection<Parade>	parades;
	private Area				area;
	private Collection<Coach>	coaches;
	private History				history;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotNull
	@Past
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	public Date getEstablishment() {
		return this.establishment;
	}

	public void setEstablishment(final Date establishment) {
		this.establishment = establishment;
	}

	@ElementCollection
	@Valid
	public Collection<Url> getPictures() {
		return this.pictures;
	}

	public void setPictures(final Collection<Url> pictures) {
		this.pictures = pictures;
	}

	// RELATIONSHIPS ---------------------------------------------------

	@Valid
	@OneToMany(mappedBy = "brotherhood")
	public Collection<Enrol> getEnrols() {
		return this.enrols;
	}

	public void setEnrols(final Collection<Enrol> enrols) {
		this.enrols = enrols;
	}

	@Valid
	@OneToMany(mappedBy = "brotherhood")
	public Collection<Parade> getParades() {
		return this.parades;
	}

	public void setParades(final Collection<Parade> parades) {
		this.parades = parades;
	}

	@Valid
	@OneToMany
	public Collection<Coach> getCoaches() {
		return this.coaches;
	}

	public void setCoaches(final Collection<Coach> coaches) {
		this.coaches = coaches;
	}

	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Area getArea() {
		return this.area;
	}

	public void setArea(final Area area) {
		this.area = area;
	}

	@Valid
	@NotNull
	@OneToOne(optional = false)
	public History getHistory() {
		return this.history;
	}

	public void setHistory(final History history) {
		this.history = history;
	}

	@Override
	public String toString() {
		return "Brotherhood [Title = " + this.getTitle() + "]";
	}
}
