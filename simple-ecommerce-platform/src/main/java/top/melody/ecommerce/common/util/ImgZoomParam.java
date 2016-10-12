package top.melody.ecommerce.common.util;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/9 14:51
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/9 14:51
 * Class Description:图片缩放参数
 * To change this template use File | Settings | File Templates.
 */
public class ImgZoomParam {
    private String mediumSuffix = "_M";
    private String smallSuffix = "_S";
    private String miniSuffix = "_SS";
    private int mediumWith = 558;
    private int mediumHeight = 558;
    private int smallWith = 337;
    private int smallHeight = 337;
    private int miniWidth = 150;
    private int miniHeight = 150;
    private double zoomRate = 1.7;
    private int btkg = 100;
    private double fxwallRate = 1.3;

    public String getMediumSuffix() {
        return mediumSuffix;
    }

    public void setMediumSuffix(String mediumSuffix) {
        this.mediumSuffix = mediumSuffix;
    }

    public String getSmallSuffix() {
        return smallSuffix;
    }

    public void setSmallSuffix(String smallSuffix) {
        this.smallSuffix = smallSuffix;
    }

    public String getMiniSuffix() {
        return miniSuffix;
    }

    public void setMiniSuffix(String miniSuffix) {
        this.miniSuffix = miniSuffix;
    }

    public int getMediumWith() {
        return mediumWith;
    }

    public void setMediumWith(int mediumWith) {
        this.mediumWith = mediumWith;
    }

    public double getFxwallRate() {
        return fxwallRate;
    }

    public void setFxwallRate(double fxwallRate) {
        this.fxwallRate = fxwallRate;
    }

    public int getBtkg() {
        return btkg;
    }

    public void setBtkg(int btkg) {
        this.btkg = btkg;
    }

    public double getZoomRate() {
        return zoomRate;
    }

    public void setZoomRate(double zoomRate) {
        this.zoomRate = zoomRate;
    }

    public int getMiniHeight() {
        return miniHeight;
    }

    public void setMiniHeight(int miniHeight) {
        this.miniHeight = miniHeight;
    }

    public int getMiniWidth() {
        return miniWidth;
    }

    public void setMiniWidth(int miniWidth) {
        this.miniWidth = miniWidth;
    }

    public int getSmallHeight() {
        return smallHeight;
    }

    public void setSmallHeight(int smallHeight) {
        this.smallHeight = smallHeight;
    }

    public int getSmallWith() {
        return smallWith;
    }

    public void setSmallWith(int smallWith) {
        this.smallWith = smallWith;
    }

    public int getMediumHeight() {
        return mediumHeight;
    }

    public void setMediumHeight(int mediumHeight) {
        this.mediumHeight = mediumHeight;
    }
}
