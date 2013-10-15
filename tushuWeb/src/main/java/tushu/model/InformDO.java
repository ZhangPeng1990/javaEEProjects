package tushu.model;

import java.io.Serializable;
import java.util.Date;

/**
 * ֪ͨ
 * @author zp
 *
 */
public class InformDO implements Serializable {
	
	private static final long serialVersionUID = -5277989462790382203L;

	private Integer id;

    private Long userId;

    private Long senderId;

    private String title;

    private Date insertTime;

    private String content;
    
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getSenderId() {
		return senderId;
	}

	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}