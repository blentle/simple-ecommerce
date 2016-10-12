package top.melody.ecommerce.platform.api.service;

import org.apache.shiro.authc.Account;


/**
 * Date: 15-2-5 下午8:28
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
public interface AccountService {
    Account register(Account account) throws Exception;

    // 根据用户登录名 查询用户
    Account getByAccountName(String accountName) throws Exception;

    Account getByAccountId(Integer accountId) throws Exception;

    boolean updateAccount(Account account) throws Exception;

}
