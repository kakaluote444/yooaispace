package com.yooai.dto;

import java.util.List;

public class TypeSayDTO {
		private int typeId;
		private List<UserSayMsgDTO> userSayMsgDTO;
		public TypeSayDTO() {
			super();
		}
		public int getTypeId() {
			return typeId;
		}
		public void setTypeId(int typeId) {
			this.typeId = typeId;
		}
		public List<UserSayMsgDTO> getUserSayMsgDTO() {
			return userSayMsgDTO;
		}
		public void setUserSayMsgDTO(List<UserSayMsgDTO> userSayMsgDTO) {
			this.userSayMsgDTO = userSayMsgDTO;
		}
		@Override
		public String toString() {
			return "TypeSayDTO [typeId=" + typeId + ", userSayMsgDTO="
					+ userSayMsgDTO + "]";
		}
	
}
