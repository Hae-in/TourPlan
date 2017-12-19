package com.yedam.tourplan.member.service;

	import org.springframework.web.multipart.MultipartFile;

	public class MemberVO {
		@Override
		public String toString() {
			return /*"MemberVO [member_img1=" + member_img1 + ", member_img2="
					+ member_img2 + ", member_img3=" + member_img3 + 
					", member_id="
					*/
					"MemberVO [memberNum=" + memberNum 
					+ ", member_id=" + member_id 
					+ ", member_password=" + member_password
					+ ", member_nickname=" + member_nickname 
					+ ", member_regDate=" + member_regDate 
					+ ", member_state=" + member_state + "]";
		}
		/*private String member_img1;
		private String member_img2;
		private String member_img3;*/
		private String memberNum;
		public String getMemberNum() {
			return memberNum;
		}
		public void setMemberNum(String memberNum) {
			this.memberNum = memberNum;
		}
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		public String getMember_password() {
			return member_password;
		}
		public void setMember_password(String member_password) {
			this.member_password = member_password;
		}
		public String getMember_nickname() {
			return member_nickname;
		}
		public void setMember_nickname(String member_nickname) {
			this.member_nickname = member_nickname;
		}
		public String getMember_regDate() {
			return member_regDate;
		}
		public void setMember_regDate(String member_regDate) {
			this.member_regDate = member_regDate;
		}
		public String getMember_state() {
			return member_state;
		}
		public void setMember_state(String member_state) {
			this.member_state = member_state;
		}
		private String member_id;
		private String member_password;
		private String member_nickname;
		private String member_regDate;
		private String member_state;
		
}
