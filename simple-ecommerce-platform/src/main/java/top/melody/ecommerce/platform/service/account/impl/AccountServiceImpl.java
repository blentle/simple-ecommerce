package top.melody.ecommerce.platform.service.account.impl;

import org.apache.shiro.authc.Account;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import top.melody.ecommerce.platform.api.service.AccountService;

/**
 * Date: 15-2-5 下午8:28
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Service
public class AccountServiceImpl implements AccountService {

    private static final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);

    @Override
    public Account register(Account account) throws Exception {
        return null;
    }

    @Override
    public Account getByAccountName(String accountName) throws Exception {
        return null;
    }

    @Override
    public Account getByAccountId(Integer accountId) throws Exception {
        return null;
    }

    @Override
    public boolean updateAccount(Account account) throws Exception {
        return false;
    }
}
