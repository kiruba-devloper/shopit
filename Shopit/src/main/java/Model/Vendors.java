package Model;

public class Vendors {
	private String	vid, vname,vpass,vemail,vmobile ,vloc;

	public Vendors() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vendors(String vid, String vname, String vpass, String vemail, String vmobile, String vloc) {
		super();
		this.vid = vid;
		this.vname = vname;
		this.vpass = vpass;
		this.vemail = vemail;
		this.vmobile = vmobile;
		this.vloc = vloc;
	}

	public String getVid() {
		return vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVpass() {
		return vpass;
	}

	public void setVpass(String vpass) {
		this.vpass = vpass;
	}

	public String getVemail() {
		return vemail;
	}

	public void setVemail(String vemail) {
		this.vemail = vemail;
	}

	public String getVmobile() {
		return vmobile;
	}

	public void setVmobile(String vmobile) {
		this.vmobile = vmobile;
	}

	public String getVloc() {
		return vloc;
	}

	public void setVloc(String vloc) {
		this.vloc = vloc;
	}

	@Override
	public String toString() {
		return "Vendors [vid=" + vid + ", vname=" + vname + ", vpass=" + vpass + ", vemail=" + vemail + ", vmobile="
				+ vmobile + ", vloc=" + vloc + "]";
	}
	
}
