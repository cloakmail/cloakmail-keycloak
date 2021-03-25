<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
      <div id="kc-form">
        <div id="kc-form-wrapper">
            <#if realm.password>
              <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}"
                    method="post">
                <div class="${properties.kcFormGroupClass!}">
                  <label for="username"
                         class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                    <#if usernameEditDisabled??>
                      <input tabindex="1" id="username" class="<#if messagesPerField.existsError('username','password')>is-invalid </#if>${properties.kcInputClass!}" name="username"
                             value="${(login.username!'')}" type="text" disabled/>
                    <#else>
                      <input tabindex="1" id="username" class="<#if messagesPerField.existsError('username','password')>is-invalid </#if>${properties.kcInputClass!}" name="username"
                             value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                             aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                      />

                        <#if messagesPerField.existsError('username','password')>
                          <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                  <label for="password" class="d-flex justify-content-between align-items-end ${properties.kcLabelClass!}">${msg("password")}

                      <#if realm.resetPasswordAllowed>
                        <span class="small"><a tabindex="5"
                                               href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                      </#if>
                  </label>


                  <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password"
                         autocomplete="off"
                         aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                  />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                  <div class="form-group form-check">
                      <#if login.rememberMe??>
                        <input class="form-check-input" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"
                               checked>
                      <#else>
                        <input class="form-check-input" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                      </#if>
                    <label class="form-check-label" for="rememberMe">
                        ${msg("rememberMe")}
                    </label>
                  </div>

                </div>
                <div id="kc-form-buttons" class="form-row px-1 ${properties.kcFormGroupClass!}">
                  <input type="hidden" id="id-hidden-input" name="credentialId"
                         <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                  <input tabindex="4"
                         class="col-sm-12 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                         name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>

                  <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div id="kc-registration-container" class="text-center">
                      <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                      </div>
                    </div>
                  </#if>
              </form>
            </#if>
        </div>

          <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="text-center ${properties.kcFormSocialAccountSectionClass!}">
              <hr/>
              <h5>${msg("identity-provider-login-label")}</h5>

              <ul class="d-flex flex-column p-0 ${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                  <#list social.providers as p>
                    <a id="social-${p.alias}"
                       class="btn-secondary my-1 ${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                        href="${p.loginUrl}">
                        <#if p.iconClasses?has_content>
                          <i class="mr-2 ${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                          <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">Log in with ${p.displayName!}</span>
                        <#else>
                          <span class="${properties.kcFormSocialAccountNameClass!}">Log in with ${p.displayName!}</span>
                        </#if>
                    </a>
                  </#list>
              </ul>
            </div>
          </#if>
      </div>
    </#if>

</@layout.registrationLayout>
