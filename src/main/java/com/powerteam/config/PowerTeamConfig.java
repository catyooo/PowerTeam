package com.powerteam.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
@Data
public class PowerTeamConfig {

    /**
     * 网站的根路径 例如 /powerteam
     */
    private String webRoot;

    /**
     * 网站绝对物理路径 例如 D:/Tomcat/webapps/powerteam/WEB-INF/classes/
     */
    private String absoluteWebRoot;

    // 系统标题
    @Value("${powerTeam.title}")
    private String title;

    // 页大小
    @Value("${powerTeam.pageSize}")
    private Integer pageSize;

    // 百度地图ak
    @Value("${powerTeam.baiduMapAk}")
    private String baiduMapAk;

    // 静态资源版本号
    @Value("${powerTeam.staticV}")
    private String staticV;

    // 邮件名
    @Value("${spring.mail.username}")
    private String mailFrom;


    public String getWebRoot() {
		return webRoot;
	}

	public void setWebRoot(String webRoot) {
		this.webRoot = webRoot;
	}

	public String getAbsoluteWebRoot() {
		return absoluteWebRoot;
	}

	public void setAbsoluteWebRoot(String absoluteWebRoot) {
		this.absoluteWebRoot = absoluteWebRoot;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getStaticV() {
        return staticV;
    }

    public void setStaticV(String staticV) {
        this.staticV = staticV;
    }

	public String getBaiduMapAk() {
		return baiduMapAk;
	}

	public void setBaiduMapAk(String baiduMapAk) {
		this.baiduMapAk = baiduMapAk;
	}

	public String getMailFrom() {
		return mailFrom;
	}

	public void setMailFrom(String mailFrom) {
		this.mailFrom = mailFrom;
	}


}
