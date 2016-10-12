package top.melody.unicall.platform.props;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

/**
 * Date: 15-2-28 下午3:43
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Component("regexConfig")
public class RegexConfig {
    @Value("${email.regex}")
    private String emailRegex;

    public Pattern getEmailPattern(){
        return Pattern.compile(emailRegex);
    }
}
