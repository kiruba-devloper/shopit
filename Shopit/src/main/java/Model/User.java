package Model;

public class User {
private String uname;
private String upass;
private String uemail;
private String umobile;

public User() {
	super();
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getUpass() {
	return upass;
}
public void setUpass(String upass) {
	this.upass = upass;
}
public String getUemail() {
	return uemail;
}
public void setUemail(String uemail) {
	this.uemail = uemail;
}
public String getUmobile() {
	return umobile;
}
public void setUmobile(String umobile) {
	this.umobile = umobile;
}
@Override
public String toString() {
	return "LoginModel [uname=" + uname + ", upass=" + upass + ", uemail=" + uemail + ", umobile=" + umobile + "]";
}
public User(String uname, String upass, String uemail, String umobile) {
	super();
	this.uname = uname;
	this.upass = upass;
	this.uemail = uemail;
	this.umobile = umobile;
}

}
