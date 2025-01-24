;; extends 

(jsx_opening_element (identifier) @open_tag)
(jsx_closing_element (identifier) @close_tag)
(jsx_attribute
  (property_identifier) @attr_name
  (string (string_fragment) @attr_classname)
  (#eq? @attr_name "className")
)
