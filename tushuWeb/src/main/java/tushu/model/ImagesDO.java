package tushu.model;

import java.io.Serializable;

public class ImagesDO implements Serializable {
	
	
	private static final long serialVersionUID = 6001575837469888861L;

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column images.id
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column images.name
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column images.url
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    private String url;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column images.index
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    private Integer index;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column images.id
     *
     * @return the value of images.id
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column images.id
     *
     * @param id the value for images.id
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column images.name
     *
     * @return the value of images.name
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column images.name
     *
     * @param name the value for images.name
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column images.url
     *
     * @return the value of images.url
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public String getUrl() {
        return url;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column images.url
     *
     * @param url the value for images.url
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column images.index
     *
     * @return the value of images.index
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public Integer getIndex() {
        return index;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column images.index
     *
     * @param index the value for images.index
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    public void setIndex(Integer index) {
        this.index = index;
    }
}