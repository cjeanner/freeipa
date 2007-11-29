<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'userlayout.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>Edit User</title>
</head>
<body>

  <div>
    <div style="float:right">
      <input type="checkbox" id="toggleprotected_checkbox"
          onclick="toggleProtectedFields(this);">
        <span class="small">edit protected fields</span>
      </input>
    </div>
    <h1>Edit User</h1>
  </div>

<?python
from ipagui.helpers import userhelper
pw_expires_days = userhelper.password_expires_in(user.get("krbPasswordExpiration"))
pw_expires_soon = userhelper.password_expires_soon(pw_expires_days)
pw_is_expired = userhelper.password_is_expired(pw_expires_days)
if pw_expires_days != 1:
    days_suffix = "s"
else:
    days_suffix = ""
?>

    <div py:if='pw_expires_soon' class="warning_message">
        ${user.get("uid")}'s password will expire in ${pw_expires_days} day${days_suffix}
    </div>
    <div py:if='pw_is_expired' class="warning_message">
        ${user.get("uid")}'s password has expired
    </div>

     ${form.display(action=tg.url('/user/update'), value=user, user_groups=user_groups)}
</body>
</html>
