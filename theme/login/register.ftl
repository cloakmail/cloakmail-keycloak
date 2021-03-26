<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
      <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <#--            <div class="${properties.kcFormGroupClass!}">-->
          <#--                <div class="${properties.kcLabelWrapperClass!}">-->
          <#--                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>-->
          <#--                </div>-->
          <#--                <div class="${properties.kcInputWrapperClass!}">-->
          <#--                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"-->
          <#--                           value="${(register.formData.firstName!'')}"-->
          <#--                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"-->
          <#--                    />-->

          <#--                    <#if messagesPerField.existsError('firstName')>-->
          <#--                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">-->
          <#--                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}-->
          <#--                        </span>-->
          <#--                    </#if>-->
          <#--                </div>-->
          <#--            </div>-->

          <#--            <div class="${properties.kcFormGroupClass!}">-->
          <#--                <div class="${properties.kcLabelWrapperClass!}">-->
          <#--                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>-->
          <#--                </div>-->
          <#--                <div class="${properties.kcInputWrapperClass!}">-->
          <#--                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"-->
          <#--                           value="${(register.formData.lastName!'')}"-->
          <#--                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"-->
          <#--                    />-->

          <#--                    <#if messagesPerField.existsError('lastName')>-->
          <#--                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">-->
          <#--                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}-->
          <#--                        </span>-->
          <#--                    </#if>-->
          <#--                </div>-->
          <#--            </div>-->

        <div class="${properties.kcFormGroupClass!}">
          <div class="${properties.kcLabelWrapperClass!}">
            <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
          </div>
          <div class="${properties.kcInputWrapperClass!}">
            <input type="text" id="email"
                   class="<#if messagesPerField.existsError('email')>is-invalid </#if>${properties.kcInputClass!}"
                   name="email"
                   value="${(register.formData.email!'')}" autocomplete="email"
                   aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
            />

              <#if messagesPerField.existsError('email')>
                <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
              </#if>
          </div>
        </div>

          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!}">
              <div class="${properties.kcLabelWrapperClass!}">
                <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
              </div>
              <div class="${properties.kcInputWrapperClass!}">
                <input type="text" id="username"
                       class="<#if messagesPerField.existsError('username')>is-invalid </#if>${properties.kcInputClass!}"
                       name="username"
                       value="${(register.formData.username!'')}" autocomplete="username"
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                />

                  <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                  </#if>
              </div>
            </div>
          </#if>

          <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!}">
              <div class="${properties.kcLabelWrapperClass!}">
                <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
              </div>
              <div class="${properties.kcInputWrapperClass!}">
                <input type="password" id="password"
                       class="<#if messagesPerField.existsError('password')>is-invalid </#if> ${properties.kcInputClass!}"
                       name="password"
                       autocomplete="new-password"
                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                />

                  <#if messagesPerField.existsError('password')>
                    <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                  </#if>
              </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
              <div class="${properties.kcLabelWrapperClass!}">
                <label for="password-confirm"
                       class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
              </div>
              <div class="${properties.kcInputWrapperClass!}">
                <input type="password" id="password-confirm"
                       class="<#if messagesPerField.existsError('password-confirm')>is-invalid </#if>${properties.kcInputClass!}"
                       name="password-confirm"
                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                />

                  <#if messagesPerField.existsError('password-confirm')>
                    <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}"
                          aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                  </#if>
              </div>
            </div>
          </#if>

          <#if recaptchaRequired??>
            <div class="form-group">
              <div class="${properties.kcInputWrapperClass!}">
                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
              </div>
            </div>
          </#if>

        <div class="pt-3 ${properties.kcFormGroupClass!}">

          <div id="kc-form-buttons" class="form-row px-1 ${properties.kcFormButtonsClass!}">
            <input class="col-sm-12 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                   type="submit" value="${msg("doRegister")}"/>
          </div>

        </div>

        <div id="kc-form-options" class="small text-center ${properties.kcFormOptionsClass!}">
          <div class="${properties.kcFormOptionsWrapperClass!}">
            <span>Already have an account? <a href="${url.loginUrl}">Log in</a> instead.</span>
          </div>
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
                          <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">Sign up with ${p.displayName!}</span>
                        <#else>
                          <span class="${properties.kcFormSocialAccountNameClass!}">Sign up with ${p.displayName!}</span>
                        </#if>
                    </a>
                  </#list>
              </ul>
            </div>
          </#if>
      </form>
    </#if>
</@layout.registrationLayout>