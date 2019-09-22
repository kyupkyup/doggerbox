package bulletin;

/**
 * @author lky
 *
 */
/**
 * @author lky
 *
 */
public class Bulletin {

	private int bulletinID;
	private String bulletinTitle;
	private String userID;
	private String userName;
	private String bulletinContent;
	private int bulletinAvailable;
	private int bulletinCategory;
	private String bulletinDate;
	private int bulletinNotice;
	private int bulletinClickCount;
	private int bulletinLikeCount;
	private int bulletinReplyCount;


	public Bulletin() {
		
		
	}
	
	public int getBulletinID() {
		return bulletinID;
	}
	public void setBulletinID(int bulletinID) {
		this.bulletinID = bulletinID;
	}
	public String getBulletinTitle() {
		return bulletinTitle;
	}
	public void setBulletinTitle(String bulletinTitle) {
		this.bulletinTitle = bulletinTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBulletinContent() {
		return bulletinContent;
	}
	public void setBulletinContent(String bulletinContent) {
		this.bulletinContent = bulletinContent;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBulletinAvailable() {
		return bulletinAvailable;
	}
	public void setBulletinAvailable(int bulletinAvailable) {
		this.bulletinAvailable = bulletinAvailable;
	}

	public String getBulletinDate() {
		return bulletinDate;
	}
	public void setBulletinDate(String bulletinDate) {
		this.bulletinDate = bulletinDate;
	}

	public int getBulletinCategory() {
		return bulletinCategory;
	}

	public void setBulletinCategory(int bulletinCategory) {
		this.bulletinCategory = bulletinCategory;
	}

	public int getBulletinNotice() {
		return bulletinNotice;
	}

	public void setBulletinNotice(int bulletinNotice) {
		this.bulletinNotice = bulletinNotice;
	}

	public int getBulletinClickCount() {
		return bulletinClickCount;
	}

	public void setBulletinClickCount(int bulletinClickCount) {
		this.bulletinClickCount = bulletinClickCount;
	}

	public int getBulletinLikeCount() {
		return bulletinLikeCount;
	}

	public void setBulletinLikeCount(int bulletinLikeCount) {
		this.bulletinLikeCount = bulletinLikeCount;
	}

	public int getBulletinReplyCount() {
		return bulletinReplyCount;
	}

	public void setBulletinReplyCount(int bulletinReplyCount) {
		this.bulletinReplyCount = bulletinReplyCount;
	}

	
}
