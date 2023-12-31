package dataTransferObject;

public class Feedback 
{
	private int feedBack_Id;
	private String userName;
	private String userMail;
	private String feedback;
	private long feed_id;
	public int getFeedBack_Id() {
		return feedBack_Id;
	}
	public void setFeedBack_Id(int feedBack_Id) {
		this.feedBack_Id = feedBack_Id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public long getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(long feed_id) {
		this.feed_id = feed_id;
	}
	@Override
	public String toString() {
		return "Feedback [feedBack_Id=" + feedBack_Id + ", userName=" + userName + ", userMail=" + userMail
				+ ", feedback=" + feedback + ", feed_id=" + feed_id + "]";
	}
	
	
}
