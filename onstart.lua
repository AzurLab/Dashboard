--程序启动时会执行的事件

--基础功能函数
--查文件
function file_check(path)
  local f=io.open(path,'r')
  if f~=nil 
  then return true 
  else return false 
  end
end

--查状态
function status_check()
  if file_check(path1.."RUNNING")
  then
    状态="Clash for Magisk运行中"
    return true
  else
    状态="Clash for Magisk未运行"
    return false
  end
end

--查配置关键词
function keyword_check(keyword,path)
  配置=io.open(path):read("*a")
  if (配置:find(keyword)) 
  then return true
  else return false
  end
end

--清理
function clean()
  os.remove (path1.."START")
  os.remove (path1.."RESTART")
  os.remove (path1.."STOP")
end

--清理配置文件中的！<str>
function repair()
  os.execute("sed -i 's/!<str> //g' "..path1.."config.yaml")
end


--启动
function start(way)
  if not starting 
  then
    starting="true"
    clean()
    os.execute("touch "..path1.."RESTART")
    print(way.."中...")
    x=50
    ti=Ticker()
    ti.Period=100
    ti.onTick=function()
      x=x-1
      if x <=45 then
        if status_check()
        then 
          print(way.."成功！")
          刷新网页()
          starting=nil
          ti.stop()
        elseif x==-1 then
          starting=nil
          ti.stop()
          if status_check()
          then print(way.."成功！")
            刷新网页()
          elseif file_check(path1.."RESTART")
          then print("模块可能未正常运行，请检查模块")
          else print(way.."失败，请检查配置文件")
          end
        end 
      end
    end
    ti.start()
    else print(way.."中，请稍候")
  end
end

function tun()
  if file_check(path0.."tun")
  then
    return true 
  else
    return false
  end
end

function findpath()
  if tun()
  then 
    path1="/storage/emulated/0/Documents/Clash/"
    path2="/Documents/Clash"
    io.open(path1.."appid.list",'a+')
  else
    if file_check("/storage/emulated/0/Android/data/com.github.kr328.clashm/starter.yaml")
    then 
      path1="/storage/emulated/0/Android/data/com.github.kr328.clashm/"
      path2="/Android/data/com.github.kr328.clashm"
    elseif file_check("/storage/emulated/0/Android/data/com.github.kr328.clash/starter.yaml")
    then 
      path1="/storage/emulated/0/Android/data/com.github.kr328.clash/"
      path2="/Android/data/com.github.kr328.clash"
    else 
      io.open(path0.."path2",'a+')
      path2=io.open(path0.."path2"):read("*a")
      if path2==""
      then
        path2_layout={
          LinearLayout;
          orientation="vertical";
          id="path2_father_layout",
          {
            TextView;
            id="linkhint",
            layout_marginTop="10dp";
            text="自动检测失败，模块可能未正常安装，如需继续使用，请手动设置模块目录",
            layout_width="80%w";
            textColor=WidgetColors,
            layout_gravity="center";
          };
          {
            EditText;
            id="path2edit",
            hint="请输入模块目录";
            Text="/Android/data/com.github.kr328.clash";
            layout_width="80%w";
            layout_gravity="center";
          };
        };
        AlertDialog.Builder(this)
        .setTitle("模块目录")
        .setView(loadlayout(path2_layout))
        .setNeutralButton("Tun模式",function()
          io.open(path0.."tun", 'w')
          退出程序()
        end)
        .setPositiveButton("确定",{onClick=function(v)
            io.open(path0.."path2","w"):write(path2edit.Text):close()
            path2=path2edit.Text
            path1="/storage/emulated/0"..path2.."/"
            print("保存成功")
          end})
        .setNegativeButton("取消",nil)
        .show()
      else
        path1="/storage/emulated/0"..path2.."/"
      end
    end
  end

  if path1
  then
    --加载控制面板
    if file_check(path1.."yacd-gh-pages/index.html")
    then
      加载网页("http://127.0.0.1:9090/ui/#/proxies")
    elseif file_check(path1.."clash-dashboard-gh-pages/index.html")
    then
      加载网页("http://127.0.0.1:9090/ui/#/proxies")
    else
      if file_check(path0.."yacd")
      then
        加载网页("http://yacd.haishan.me/#/proxies")
      else
        加载网页("http://clash.razord.top/#/proxies")
      end
    end
  end
end
--函数结束

--path0 长工作目录，用于shell
--path1 长配置目录，用于shell
--path2 短配置目录，用于下载
--path4 短工作目录，用于下载
--建立Dashboard工作文件存放目录,避免出错
path0="/storage/emulated/0/Android/data/com.dashboard/"
os.execute("mkdir –p "..path0)
path4="/Android/data/com.dashboard"

--识别配置目录
findpath()

if path1
then
  if not tun()
  then 
    --播报当前状态
    status_check()
    local a=tonumber(os.date("%H"))
    if (a>=18)
    then print("晚上好！"..状态)
    elseif (a>=13)
    then print("下午好！"..状态)
    elseif (a>=11)
    then print("中午好！"..状态)
    elseif (a>=5)
    then print("早上好！"..状态)
    else print("晚上好！"..状态)
    end
  end
end
