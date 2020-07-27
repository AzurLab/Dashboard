## 启动CFM

0. 安装Clash for Magisk模块，重启

1. 打开Dashboard App，右上角菜单，选择更新GeoIP，无需输入地址，点击确定来下载GeoIP文件，这是Clash工作所需要的文件。

2. 右上角菜单选择订阅或导入您的Clash配置

3. 右上角菜单选择自动修改，修改您的配置，以适配CFM

4. 点击启动Clash，享受网上冲浪


## 全部功能说明

### 侧边栏：

1. **控制面板**

    控制面板默认为 [razord](http://clash.razord.top/)
如果已经在控制面板页面，再次点击切换至 [yacd](http://yacd.haishan.me/)

    每次打开App将加载默认控制面板，如果控制面板弹框，请尝试填写 127.0.0.1 9090，密码不填。

    请注意，如果您没有启动 clash，控制面板当然是无法加载的。

2. **书签页面**

    可以收藏一个您喜欢的任意网站，该网站可以在 设置 修改

    务必完整包含http:// 或https:// 否则可能无法加载

3. **网络测速**

    默认为 Speedtest.com 如果已在测速页面，再次点击切换至 Fast.com

4. **IP查询**

    默认为 [ip.skk.moe](https://ip.skk.moe/)，再次点击切换至 [ip.sb](https://ip.sb)

5. **本地面板**

    下载本地面板来替换在线面板，需要修改配置文件增加

    `external-ui: yacd-gh-pages`

    或`external-ui: clash-dashboard-gh-pages`
    
    解压及自动修改时，将自动为您添加，为使本地面板生效，需要重新启动Clash。

    _推荐您使用本功能，本地控制面板的加载更迅速，而且稳定_

6. **raw>cdn**

    小功能，将 github raw 链接转换为[Jsdelivr]() cdn 加速链接

7. **更新内核**

    更新内核

8. **配置修复**

    Clash 1.0.0版本起，启用了一些新的 field names 并不再兼容旧版，如果您使用的配置文件不同，可以选择升级或降级来适配Clash

9. **黑名单**

    支持自动导入包名列表，格式为每行一个包名，可从SSR、V2rayNG、Kitsunebi等导出

    注意：如果DNS enhanced mod 使用fake-ip，黑名单可能无法正常使用。

10. **设置**

    用于锁定/解锁 1. 3. 4. 自动切换的页面，修改收藏夹


11. **Tun模式**

    开启Tun模式之后，Dashboard所有功能将对 
 [Clash Tun for Magisk]() 适配，需要授予su权限来启动或停止 [Clash Tun for Magisk]()

12. **反馈**

13. **退出**

### 菜单栏：

1. **启动Clash**

     启动 Clash for Magisk

2. **停止Clash**

    停止 Clash for Magisk

3. **重启Clash**

    重启 Clash for Magisk

4. **更新GeoIP**

    

5. **备份/恢复**

    手动备份和恢复您的配置，最大备份数为2，新的备份顶替旧的备份，恢复前的配置文件将自动备份为config.rec，以防万一。

6. **自动修改**

    自动修改基础配置以适配 Clash for Magisk，可选DNS enhanced mod redir-host或者 fake-ip，具体配置参考[Clash 配置说明](https://github.com/Dreamacro/clash/wiki/configuration)

    您也可以自定义，需要完整填入配置文件中 proxies: 之前的全部内容

    注意：fake-ip模式下，黑名单可能不能正常使用

7. **编辑配置**

    点按调用外部文本编辑器打开您的配置文件，考虑兼容性问题，会调用打开.txt的应用

8. **导入配置**

    选择一个本地配置文件，如果配置文件不是yaml格式，将会提示确认，如果您确认会自动导入并改名

9. **打开终端**

    打开 Termux，同时复制 `./subconverter/subconverter\n` 至剪贴板

10. **下载订阅**

    下载订阅和导入配置时，旧的配置文件将会被清理并自动备份，如果下载失败，请在此项对话框恢复，这不会影响您的手动备份


### 顶栏按钮

1. 打开当前页面桌面版

2. 刷新当前页面

