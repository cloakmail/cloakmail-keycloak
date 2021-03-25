<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
      <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post" novalidate>
        <span class="small">${msg("emailInstruction")}</span>
        <div class="mt-3 ${properties.kcFormGroupClass!}">
            <#--                <div class="${properties.kcLabelWrapperClass!}">-->
            <#--                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>-->
            <#--                </div>-->
          <div class="${properties.kcInputWrapperClass!}">
              <#if auth?has_content && auth.showUsername()>
                <input required type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus
                       value="${auth.attemptedUsername}"
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
              <#else>
                <input required type="text" placeholder="${msg("email")}" id="username" name="username"
                       class="<#if messagesPerField.existsError('username')>is-invalid </#if>${properties.kcInputClass!}" autofocus
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
              </#if>

              <#if messagesPerField.existsError('username')>
                <div id="input-error-username" class="<#if messagesPerField.existsError('username')>is-invalid </#if>${properties.kcInputErrorMessageClass!}"
                      aria-live="polite">Please specify an email.</div>
              </#if>
          </div>
        </div>
        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">

          <div id="kc-form-buttons" class="form-row px-1 ${properties.kcFormButtonsClass!}">
            <input class="col-12 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                   type="submit" value="Reset"/>
          </div>

        </div>
        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
          <div class="${properties.kcFormOptionsWrapperClass!}">
            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
          </div>
        </div>
      </form>
    </#if>
</@layout.registrationLayout>
