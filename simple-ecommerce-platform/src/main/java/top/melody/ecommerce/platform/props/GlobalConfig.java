package top.melody.ecommerce.platform.props;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Date: 15-1-15 下午3:26
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Component("global")
public class GlobalConfig {
    @Value("${verify.code.max.active}")
    public Integer verifyCodeMaxActive;
    @Value("${file.upload.path}")
    private String fileRootPath;
    @Value("${file.server}")
    private String fileServer;
    @Value("${packages.type}")
    private List<String> packagesType;
    @Value("${pic.medium.suffix}")
    private String mediumSuffix;
    @Value("${pic.small.suffix}")
    private String smallSuffix;
    @Value("${pic.mini.suffix}")
    private String miniSuffix;
    @Value("${pic.medium.width}")
    private int picMediumWidth;
    @Value("${pic.medium.height}")
    private int picMediumHeight;
    @Value("${pic.small.width}")
    private int picSmallWidth;
    @Value("${pic.small.height}")
    private int picSmallHeight;
    @Value("${pic.mini.width}")
    private int picMiniWidth;
    @Value("${pic.mini.height}")
    private int picMiniHeight;
    @Value("${pic.zoom.rate}")
    private double picZoom;
    @Value("${pick.btkg}")
    private int btkg;
    @Value("${pick.fxwall.rate}")
    private double fxwallRate;
    //页面展示套餐的国家
    @Value("${packages.index.country}")
    private String packagesIndexCountry;
    //图片域名
    @Value("${img.domain}")
    private String imgDomain;
    //手机制式
    @Value("${phone.standard}")
    private String phoneStandard;
    //商品加入购物车最长时间未生成订单自动取消，单位s(秒)
    @Value("${lock.goods.trolley.max.time}")
    private int goodsInTrolleyMaxTime;
    //订单未支付,最长时间后自动取消，时间单位s(秒)
    @Value("${lock.order.cancel.max.time}")
    private int orderAutoCancelMaxTime;

    // --- app config
    @Value("${app.index.open.country.size}")
    private int appIndexOpenCountrySize;
    @Value("${app.index.close.country.size}")
    private int appIndexCloseCountrySize;
    @Value("${app.service.numbers.size}")
    private int appServiceNumbersSize;
    @Value("${timer.shopcart.corn.expression}")
    private String shopCartCornExpression;
    @Value("${timer.order.corn.expression}")
    private String orderCornExpression;

    private static Map<Integer,Integer> digitsMap;
    private static Map<String, Integer> phoneStandardMap;
    static {
        digitsMap = new LinkedHashMap<Integer,Integer>();
        for(int index = 0 ; index < 10 ; index++) {
            digitsMap.put(index,1 << index);
        }
        phoneStandardMap = new HashMap<String, Integer>();
        phoneStandardMap.put("GSM",1 << 0);
        phoneStandardMap.put("WCDMA",1 << 1);
        phoneStandardMap.put("WCDMA2000",1 << 2);
    }
    public String getFileRootPath() {
        return fileRootPath;
    }

    public String getFileServer() {
        return fileServer;
    }

    public String getMediumSuffix() {
        return mediumSuffix;
    }

    public String getSmallSuffix() {
        return smallSuffix;
    }

    public String getMiniSuffix() {
        return miniSuffix;
    }

    public List<String> getPackagesType() {
        return packagesType;
    }

    public Integer getVerifyCodeMaxActive() {
        return verifyCodeMaxActive;
    }

	public String getPackagesIndexCountry() {
		return packagesIndexCountry;
	}

    public String getImgDomain() {
		return imgDomain;
	}

    public int getPicMediumWidth() {
        return picMediumWidth;
    }

    public int getPicMediumHeight() {
        return picMediumHeight;
    }

    public int getPicSmallWidth() {
        return picSmallWidth;
    }

    public int getPicSmallHeight() {
        return picSmallHeight;
    }

    public int getPicMiniWidth() {
        return picMiniWidth;
    }

    public int getPicMiniHeight() {
        return picMiniHeight;
    }

    public double getPicZoom() {
        return picZoom;
    }

    public int getBtkg() {
        return btkg;
    }

    public double getFxwallRate() {
        return fxwallRate;
    }

    public int getGoodsInTrolleyMaxTime() {
        return goodsInTrolleyMaxTime;
    }

    public int getOrderAutoCancelMaxTime() {
        return orderAutoCancelMaxTime;
    }

    public static Map<Integer, Integer> getDigitsMap() {
        return digitsMap;
    }

	public String getPhoneStandard() {
		return phoneStandard;
	}
    
	public static Map<String, Integer> getPhoneStandardMap() {
		return phoneStandardMap;
	}

    // app
    public int getAppIndexOpenCountrySize(){
        return appIndexOpenCountrySize;
    }

    public int getAppIndexCloseCountrySize(){
        return appIndexCloseCountrySize;
    }

    public int getAppServiceNumbersSize() {
        return appServiceNumbersSize;
    }

    public String getShopCartCornExpression() {
        return shopCartCornExpression;
    }

    public String getOrderCornExpression() {
        return orderCornExpression;
    }
}
