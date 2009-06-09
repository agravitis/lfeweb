(defrecord email from to subject body)
(defrecord elementbase (module 'undefined)      id actions (show_if 'true) (class '"") (style '""))
(defrecord template (module 'element_template)  id actions (show_if 'true) (class '"") (style '"") file (bindings '()))
(defrecord body (module 'element_body)          id actions (show_if 'true) (class '"") (style '""))
(defrecord h1 (module 'element_h1)              id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord h2 (module 'element_h2)              id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord h3 (module 'element_h3)              id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord h4 (module 'element_h4)              id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord pre (module 'element_pre)            id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord list (module 'element_list)          id actions (show_if 'true) (class '"") (style '""))
(defrecord listitem (module 'element_listitem)  id actions (show_if 'true) (class '"") (style '"") (numbered 'false) (body '()))
(defrecord br (module 'element_br)              id actions (show_if 'true) (class '"") (style '""))
(defrecord hr (module 'element_hr)              id actions (show_if 'true) (class '"") (style '""))
(defrecord p (module 'element_p)                id actions (show_if 'true) (class '"") (style '"") (body '""))
(defrecord label (module 'element_label)        id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord value (module 'element_value)        id actions (show_if 'true) (class '"") (style '"") (html_encode 'true))
(defrecord link (module 'element_link)          id actions (show_if 'true) (class '"") (style '"") (text '"") (body '"") (html_encode 'true) (url '"javascript:") postback)
(defrecord error (module 'element_error)        id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord span (module 'element_span)          id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord button (module 'element_button)      id actions (show_if 'true) (class '"") (style '"") (text '"Button") (html_encode 'true) postback)
(defrecord literal (module 'element_literal)    id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord textbox (module 'element_textbox)    id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true) next postback)
(defrecord hidden (module 'element_hidden)      id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true))
(defrecord textarea (module 'element_textarea)  id actions (show_if 'true) (class '"") (style '"") (text (list 13)) (html_encode 'true))
(defrecord datepicker_textbox 
  (module 'element_datepicker_textbox)          id actions (show_if 'true) (class '"") (style '"") (text '"") next (html_encode 'true) (validators '()) (options '"{dateFormat:'yy-mm-dd'}"))
(defrecord checkbox (module 'element_checkbox)  id actions (show_if 'true) (class '"") (style '"") (text '"") (html_encode 'true) (checked 'false) postback)
(defrecord panel (module 'element_panel)        id actions (show_if 'true) (class '"") (style '"") 
  (body '""))
(defrecord image (module 'element_image)        id actions (show_if 'true) (class '"") (style '"") 
  (image '"") alt)


(defrecord inplace_textbox  
  (module 'element_inplace_textbox)             id actions (show_if 'true) (class '"") (style '"") tag 
  (text '"") (html_encode 'true) (start_mode 'view) (validators '()))
(defrecord wizard
  (module 'element_wizard)                      id actions (show_if 'true) (class '"") (style '"") tag 
  titles steps)
(defrecord upload  
  (module 'element_upload)                      id actions (show_if 'true) (class '"") (style '"") tag 
  (show_button 'true) (button_text '"Upload"))
(defrecord validate (module 'action_validate) 
                trigger target actions (show_if 'true)
		(on 'submit) (success_text '" ") validators attach_to)
(defrecord validation_error (module 'action_validation_error) 
                                                trigger target actions (show_if 'true)
						(text '""))
(defrecord alert (module 'action_alert)        trigger target actions (show_if 'true) (text '""))
(defrecord flash (module 'action_flash)        trigger target actions (show_if 'true))
(defrecord script (module 'action_script)       trigger target actions (show_if 'true) (class '"") (style '"") script)
(defrecord actionbase (module 'undefined)       trigger target actions (show_if 'true))
(defrecord event (module 'action_event)         trigger target actions (show_if 'true) (type 'click) (delay 1) postback delegate)
(defrecord comet_start (module 'action_comet_start)  trigger target actions (show_if 'true))



(defrecord is_required       (module 'validator_is_required) (text '"Required"))
(defrecord is_email          (module 'validator_is_email) (text '"Invalid e-mail address"))
(defrecord is_integer        (module 'validator_is_integer) (text '"Invalid value"))
(defrecord min_length        (module 'validator_min_length) (text '"Value out of range"))
(defrecord max_length        (module 'validator_max_length) (text '"Value out of range"))
(defrecord confirm_password  (module 'validator_confirm_password) (text '"Passwords must match"))

