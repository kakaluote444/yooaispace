package com.yooai.modal;

import java.util.Date;

public class Suggestion {
    private Integer suggestionId;

    private Integer userId;

    private Date suggestionDatatime;

    private String suggestionContent;

    public Integer getSuggestionId() {
        return suggestionId;
    }

    public void setSuggestionId(Integer suggestionId) {
        this.suggestionId = suggestionId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getSuggestionDatatime() {
        return suggestionDatatime;
    }

    public void setSuggestionDatatime(Date suggestionDatatime) {
        this.suggestionDatatime = suggestionDatatime;
    }

    public String getSuggestionContent() {
        return suggestionContent;
    }

    public void setSuggestionContent(String suggestionContent) {
        this.suggestionContent = suggestionContent == null ? null : suggestionContent.trim();
    }
}