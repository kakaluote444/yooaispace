package com.yooai.dto;

public class HoneyFriendDTO {
		private int friendId;
		private String headIcon;
		private String friendName;
		private int honey;
		public HoneyFriendDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public int getFriendId() {
			return friendId;
		}
		public void setFriendId(int friendId) {
			this.friendId = friendId;
		}
		public String getFriendName() {
			return friendName;
		}
		public void setFriendName(String friendName) {
			this.friendName = friendName;
		}
		public int getHoney() {
			return honey;
		}
		public void setHoney(int honey) {
			this.honey = honey;
		}
		
		public String getHeadIcon() {
			return headIcon;
		}
		public void setHeadIcon(String headIcon) {
			this.headIcon = headIcon;
		}
		@Override
		public String toString() {
			return "HoneyFriend [friendId=" + friendId + ", headIcon="
					+ headIcon + ", friendName=" + friendName + ", honey="
					+ honey + "]";
		}
		
}
