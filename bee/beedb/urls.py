from django.urls import path
from django.contrib.auth import views as auth_views


from . import views, profile

app_name = "beedb"
urlpatterns = [
    path("", views.index, name="index"),
    path("apiary/<int:ap_ref>/", views.apDetail, name="apDetail"),
    path("apiary/add/", views.apAdd, name="apAdd"),
    path("apiary/modify/<int:ap_ref>/", views.apMod, name="apMod"),
    path("colony/<int:col_ref>/", views.colDetail, name="colDetail"),
    path("colony/add/<int:ap_ref>/<int:col_add_type>/", views.colAdd, name="colAdd"),
    path("colony/modify/<int:col_ref>/", views.colMod, name="colMod"),
    path("colony/moveChoose/<int:col_ref>/", views.colMoveChoose, name="colMoveChoose"),
    path(
        "colony/moveSelect/<int:col_ref>/<int:ap_ref>/",
        views.colMoveSelect,
        name="colMoveSelect",
    ),
    path("colony/transfer/<int:col_ref>/", views.colTransfer, name="colTransfer"),
    path("colony/split/<int:col_ref>/", views.colSplit, name="colSplit"),
    path("colony/combine/<int:col_ref>/", views.colCombine, name="colCombine"),
    path("colony/combine1/<int:col1_ref>/<int:col2_ref>/", views.colCombine1, name="colCombine1"),
    path("colony/combine2/<int:col1_ref>/<int:col2_ref>/", views.colCombine2, name="colCombine2"),
    path("colony/dead/<int:col_ref>/", views.colDead, name="colDead"),
    path("colony/adddiary/<int:col_ref>/", views.colDiaryAdd, name="colDiaryAdd"),
    path("inspection/<int:ins_ref>/", views.inspectDetail, name="inspectDetail"),
    path("inspection/modify/<int:ins_ref>/", views.inspectMod, name="inspectMod"),
    path("inspection/add/<int:col_ref>/", views.inspectAdd, name="inspectAdd"),
    path("inspection/del/<int:ins_ref>/", views.inspectDel, name="inspectDel"),
    path("diary/<int:diary_ref>/", views.diaryDetail, name="diaryDetail"),
    path("diary/modify/<int:diary_ref>/", views.diaryMod, name="diaryMod"),
    path("diary/complete/<int:diary_ref>/<int:col_ref>/", views.colDiaryComplete, name="colDiaryComplete"),

    path("profile/", profile.profileDetail, name="profileDetail"),
    path("profileMod/", profile.profileMod, name="profileMod"),
    path("passwordMod/", auth_views.PasswordChangeView.as_view(
            template_name='beedb/profile/change_password.html',
            success_url = '/beedb/'
        ),
        name='change_password'
    ),
    path("inspectPrefDetail/", profile.inspectPrefDetail, name="inspectPrefDetail"),
    path("inspectPrefMod/", profile.inspectPrefMod, name="inspectPrefMod"),
    path("commsPrefDetail/", profile.commsPrefDetail, name="commsPrefDetail"),
    path("commsPrefMod/", profile.commsPrefMod, name="commsPrefMod"),

    # Displays purchases & sales
    path("purch/", views.purchSales, name="purchSales"),

    # Feedback section
    path("fbIndex/", views.feedbackIndex, name="fbIndex"),
    path("fbAdd/", views.userFeedbackAdd, name="userfbAdd"),
    path("fbView/<int:fb_ref>", views.userFeedbackView, name="userfbView"),
    path("fbMod/<int:fb_ref>", views.adminFeedbackMod, name="adminfbMod"),


    path("logout/", views.logout, name="logout"),
    path("login/", views.login, name="login"),
    path("signup/", views.signup, name="signup"),
    path(
        "activate/(<uidb64>[0-9A-Za-z_\-]+)/(<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/",
        views.activate_account,
        name="activate",
    ),

    path(
        "password-reset/",
        auth_views.PasswordResetView.as_view(
            template_name="accounts/password_reset.html",
            email_template_name="accounts/email/password_reset_email.txt",
            subject_template_name="accounts/email/password_reset_subject.txt",
            success_url= 'password_reset_done',
        ),
        name="password_reset",
    ),

    path(
        "password-reset/password_reset_done/",
        auth_views.PasswordResetDoneView.as_view(
            template_name="accounts/password_reset_done.html",
        ),
        name="password_reset_done",
    ),
    path(
        "password-confirm/(<uidb64>[0-9A-Za-z_\-]+)/(<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/",
        auth_views.PasswordResetConfirmView.as_view(
            template_name="accounts/password_reset_confirm.html",
            success_url="password_reset_complete",
        ),
        name="password_reset_confirm",
    ),
    path(
        "password-confirm/(<uidb64>[0-9A-Za-z_\-]+)/(<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/password_reset_complete",
        auth_views.PasswordResetCompleteView.as_view(
            template_name="accounts/password_reset_complete.html"
        ),
        name="password_reset_complete",
    ),

]

