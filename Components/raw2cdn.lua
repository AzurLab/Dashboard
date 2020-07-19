rawlink=nil
import "android.content.Context"
rawlink=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText() 
if not rawlink then rawlink="" end
function raw2()
  if (rawlink:find("raw.githubusercontent"))
  then
    user,repo,branch,file=rawlink:match("https://raw.githubusercontent.com/(.-)/(.-)/(.-)/(.+)")
  elseif (rawlink:find("github.com"))
  then
    user,repo,urbf,branch,file=rawlink:match("https://github.com/(.-)/(.-)/(.-)/(.-)/(.+)")
    if urbf=="releases"
    then file=nil
    end
  elseif rawlink:find("cdn.jsdelivr.net")
  then print("already is")
  end
end

function raw2cdn()
  print(rawlink)
  print(">>>")
  cdn="https://cdn.jsdelivr.net/gh/"..user.."/"..repo.."@"..branch.."/"..file
  print(cdn)
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(cdn)
  print("已复制到剪贴板")
end

raw2()
if file
then
  raw2cdn()
else
  import "android.net.Uri"
  rawLayout={
    LinearLayout;
    orientation="vertical";
    id="diy_father_layout",
    {
      TextView;
      id="rawhint",
      layout_marginTop="10dp";
      text="自动将github raw链接转换为jsdelivr cdn链接",
      layout_width="80%w";
      textColor=WidgetColors,
      layout_gravity="center";
    };
    {
      EditText;
      id="rawedit",
      --      hint="";
      --      Text=;
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  AlertDialog.Builder(this)
  .setTitle("raw>cdn")
  .setView(loadlayout(rawLayout))
  .setPositiveButton("确定", function()
    rawlink=rawedit.Text
    raw2()
    if file
    then
      raw2cdn()
    else
      print("error")
    end
  end)
  .setNegativeButton("取消", nil)
  .show();
end
