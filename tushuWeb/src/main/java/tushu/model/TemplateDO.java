package tushu.model;

import java.io.Serializable;

public class TemplateDO implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -6460024365370550135L;

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column template.id
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column template.name
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column template.li_Class
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    private String liClass;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column template.a_Class
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    private String aClass;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column template.id
     *
     * @return the value of template.id
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column template.id
     *
     * @param id the value for template.id
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column template.name
     *
     * @return the value of template.name
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column template.name
     *
     * @param name the value for template.name
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column template.li_Class
     *
     * @return the value of template.li_Class
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public String getLiClass() {
        return liClass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column template.li_Class
     *
     * @param liClass the value for template.li_Class
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public void setLiClass(String liClass) {
        this.liClass = liClass == null ? null : liClass.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column template.a_Class
     *
     * @return the value of template.a_Class
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public String getaClass() {
        return aClass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column template.a_Class
     *
     * @param aClass the value for template.a_Class
     *
     * @mbggenerated Fri Nov 01 13:53:51 CST 2013
     */
    public void setaClass(String aClass) {
        this.aClass = aClass == null ? null : aClass.trim();
    }
}