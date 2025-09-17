{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 and settings.languages_footer %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-footer js-hide-footer-while-scrolling {% if settings.footer_colors %}footer-colors{% endif %} display-when-content-ready overflow-none" data-store="footer">
	{% if template != 'password' %}
		{% if settings.news_show %}
			{% include 'snipplets/newsletter.tpl' with {form_data_store: 'newsletter-form'} %}
		{% endif %}
	{% endif %}
		<div class="container py-3">
			<div class="row">
				{% if template != 'password' %}
					{# Foot Nav #}
					{% if has_footer_menu %}
						<div class="{% if settings.footer_menus_toggle %}js-accordion-private-container accordion{% endif %} col-md">
							{% if settings.footer_menus_toggle %}
								<a href="#" class="js-accordion-private-toggle-mobile row align-items-center">
							{% endif %}
								{% if settings.footer_menu_title %}
									<div class="font-big {% if settings.footer_menus_toggle %}col p-3{% else %}py-3{% endif %}">{{ settings.footer_menu_title }}</div>
								{% endif %}
							{% if settings.footer_menus_toggle %}
									<div class="d-md-none col-auto icon-48px">
										<span class="js-accordion-private-toggle-inactive">
											<svg class="icon-inline icon-lg"><use xlink:href="#plus"/></svg>
										</span>
										<span class="js-accordion-private-toggle-inactive" style="display: none;">
											<svg class="icon-inline icon-lg"><use xlink:href="#minus"/></svg>
										</span>
									</div>
								</a>
								<div class="js-accordion-private-content js-accordion-private-content-mobile">
							{% endif %}
									{% include "snipplets/navigation/navigation-foot.tpl" %}
							{% if settings.footer_menus_toggle %}
								</div>
							{% endif %}
						</div>
					{% endif %}

					{# Foot Nav Secondary #}
					{% if has_footer_menu_secondary %}
						<div class="{% if settings.footer_menus_toggle %}js-accordion-private-container accordion{% endif %} col-md">
							{% if settings.footer_menus_toggle %}
								<a href="#" class="js-accordion-private-toggle-mobile row align-items-center">
							{% endif %}
								{% if settings.footer_menu_secondary_title %}
									<div class="font-big {% if settings.footer_menus_toggle %}col p-3{% else %}py-3{% endif %}">{{ settings.footer_menu_secondary_title }}</div>
								{% endif %}
							{% if settings.footer_menus_toggle %}
									<div class="d-md-none col-auto icon-48px">
										<span class="js-accordion-private-toggle-inactive">
											<svg class="icon-inline icon-lg"><use xlink:href="#plus"/></svg>
										</span>
										<span class="js-accordion-private-toggle-inactive" style="display: none;">
											<svg class="icon-inline icon-lg"><use xlink:href="#minus"/></svg>
										</span>
									</div>
								</a>
								<div class="js-accordion-private-content js-accordion-private-content-mobile">
							{% endif %}
									{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
							{% if settings.footer_menus_toggle  %}
								</div>
							{% endif %}
						</div>
					{% endif %}

					{# Contact info #}
					{% if has_footer_contact_info %}
						<div class="{% if settings.footer_menus_toggle %}js-accordion-private-container accordion{% endif %} col-md">
							{% if settings.footer_menus_toggle %}
								<a href="#" class="js-accordion-private-toggle-mobile row align-items-center">
							{% endif %}
								{% if settings.footer_contact_title %}
									<div class="font-big {% if settings.footer_menus_toggle %}col p-3{% else %}py-3{% endif %}">{{ settings.footer_contact_title }}</div>
								{% endif %}
							{% if settings.footer_menus_toggle %}
									<div class="d-md-none col-auto icon-48px">
										<span class="js-accordion-private-toggle-inactive">
											<svg class="icon-inline icon-lg"><use xlink:href="#plus"/></svg>
										</span>
										<span class="js-accordion-private-toggle-inactive" style="display: none;">
											<svg class="icon-inline icon-lg"><use xlink:href="#minus"/></svg>
										</span>
									</div>
								</a>
								<div class="js-accordion-private-content js-accordion-private-content-mobile">
							{% endif %}
									{% include "snipplets/contact-links.tpl" with {footer: true} %}
							{% if settings.footer_menus_toggle %}
								</div>
							{% endif %}
						</div>
					{% endif %}
				{% endif %}
				{% if has_social_network %}
					<div class="col-md py-3 text-center{% if template != 'password' %} text-md-left{% endif %}">
						{% include "snipplets/social/social-links.tpl" %}
					</div>
				{% endif %}
			</div>
		</div>

		{% if template != 'password' and (has_shipping_payment_logos or has_languages or has_seal_logos) %}
			<div class="divider d-none d-md-block m-0"></div>
			<div class="container">
				{% if has_shipping_payment_logos or has_languages %}
					<div class="row align-items-center py-4">
						{# Logos Payments and Shipping #}

						{% if has_payment_logos %}
							<div class="col-md footer-payments-shipping-logos mb-3 mb-md-0{% if has_languages %} mt-md-1{% endif %}">
								<span class="d-block d-md-inline-block align-middle mb-3 mb-md-1 mr-md-2">{{ "Medios de pago" | translate }}</span>
								<span class="d-inline-block align-middle">
									{{ component('payment-shipping-logos', {'type' : 'payments'}) }}
								</span>
							</div>
						{% endif %}

						{% if has_shipping_logos %}
							<div class="col-md footer-payments-shipping-logos mb-3 mb-md-0{% if has_languages %} mt-md-1{% endif %}">
								<span class="d-block d-md-inline-block align-middle mb-3 mb-md-1 mr-md-2">{{ "Medios de envío" | translate }}</span>
								<span class="d-inline-block align-middle">
									{{ component('payment-shipping-logos', {'type' : 'shipping'}) }}
								</span>
							</div>
						{% endif %}

						{# Language selector #}

						{% if has_languages %}
							<div class="col-md-auto{% if has_shipping_payment_logos %} mt-1 mt-md-0{% endif %}">
								<a href="#" data-toggle="#languages" class="js-modal-open btn-link">
									{{ "Idiomas y monedas" | translate }}
								</a>
								{% embed "snipplets/modal.tpl" with{modal_id: 'languages', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header_title: true, modal_footer: false, modal_width: 'centered', modal_zindex_top: true} %}
									{% block modal_head %}
										{{ 'Idiomas y monedas' | translate }}
									{% endblock %}
									{% block modal_body %}
										{% include "snipplets/navigation/navigation-lang.tpl" %}
									{% endblock %}
								{% endembed %}
							</div>
						{% endif %}
					</div>
				{% endif %}

				{# AFIP - EBIT - Custom Seal #}
				{% if has_seal_logos %}
					<div class="row text-center">
						<div class="col p-3">
							{% if store.afip or ebit %}
								{% if store.afip %}
									<div class="footer-logo afip seal-afip">
										{{ store.afip | raw }}
									</div>
								{% endif %}
								{% if ebit %}
									<div class="footer-logo ebit seal-ebit">
										{{ ebit }}
									</div>
								{% endif %}
							{% endif %}
							{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
								{% if "seal_img.jpg" | has_custom_image %}
									<div class="footer-logo custom-seal">
										{% if settings.seal_url != '' %}
											<a href="{{ settings.seal_url | setting_url }}" target="_blank">
										{% endif %}
											<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
										{% if settings.seal_url != '' %}
											</a>
										{% endif %}
									</div>
								{% endif %}
								{% if settings.custom_seal_code %}
									<div class="custom-seal custom-seal-code">
										{{ settings.custom_seal_code | raw }}
									</div>
								{% endif %}
							{% endif %}
						</div>
					</div>
				{% endif %}

			</div>
		{% endif %}

	<div class="js-footer-legal footer-legal">
		<div class="container">
			<div class="row align-items-center text-center text-md-left">
				<div class="col-md font-smallest">
					<div class="d-inline-block mr-md-2">
						{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
					</div>

					{{ component('claim-info', {
							container_classes: "d-md-inline-block mt-md-0 mt-3",
							divider_classes: "mx-1 d-none d-md-inline-block",
							text_classes: {text_consumer_defense: 'd-inline-block mb-2 mb-md-0'},
							link_classes: {
								link_consumer_defense: "btn-link font-smallest",
								link_order_cancellation: "btn-link font-smallest d-md-inline-block d-block mb-2 mb-md-0 w-100 w-md-auto",
							},
						}) 
					}}
				</div>
				<div class="col-md-auto">
					{#
					La leyenda que aparece debajo de esta linea de código debe mantenerse
					con las mismas palabras y con su apropiado link a Tienda Nube;
					como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
					Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
					tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
					Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
					palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
					http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
					e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
					manter visivél e com um link funcionando.
					#}
					{{ new_powered_by_link }}
				</div>
			</div>
		</div>
	</div>
</footer>