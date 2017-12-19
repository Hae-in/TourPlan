package com.yedam.tourplan.member.service;

	import org.springframework.web.multipart.MultipartFile;

	public class MemberVO {
		/*@Override
		public String toString() {
			return "MemberVO [member_img1=" + member_img1 + ", member_img2="
					+ member_img2 + ", member_img3=" + member_img3 + 
					", member_id="
					
					"MemberVO [memberNum=" + memberNum 
					+ ", member_id=" + member_id 
					+ ", member_password=" + member_password
					+ ", member_nickname=" + member_nickname 
					+ ", member_regDate=" + member_regDate 
					+ ", member_state=" + member_state + "]";
		}
		private String member_img1;
		private String member_img2;
		private String member_img3;*/
		private String membernum;
		private String id;
		private String password;
		private String regdate;
		private String state;
		private String nickname;
		public String getMembernum() {
			return membernum;
		}
		public void setMembernum(String membernum) {
			this.membernum = membernum;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		
}
