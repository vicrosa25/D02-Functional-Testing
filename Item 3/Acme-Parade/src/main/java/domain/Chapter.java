package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@Access(AccessType.PROPERTY)
public class Chapter extends Actor {
	
	// Attributes ------------------------------------------------------------------------------------------
	private String title;

	
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	// Relationships -----------------------------------------------------------------------------------------
	private Area area;


	@OneToOne(optional = false)
	public Area getArea() {
		return this.area;
	}
	
	public void setArea(Area area) {
		this.area = area;
	}

	// Other Methods -------------------------------------------------------------------------------------------
	@Override
	public String toString() {
		return "Chapter [title=" + this.title + ", area=" + this.area + "]";
	}
}
