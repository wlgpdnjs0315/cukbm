package MemberPkg;

public class MemberBean {

   private String id;
   private String pwd;
   private String snsid;
   private String name;
   private String gender;
   private String team;
   private int age;

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getSnsId() {
      return snsid;
   }

   public void setSnsId(String snsid) {
      this.snsid = snsid;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public String getTeam() {
	      return team;
   }
   public void setTeam(String team) {
	      this.team = team;
   }

   public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}