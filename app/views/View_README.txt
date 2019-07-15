The views subdirectory contains the display templates that will be displayed to the user after a successful request. By default they are written in HTML with embedded ruby (.html.erb). The embedded ruby is used to insert data from the application. It is then converted to HTML and sent to the browser of the user. It has subdirectories for every resource of our application, e.g. places, persons. These subdirectories contain the associated view files.

Files starting with an underscore (_) are called partials. Those are parts of a view which are reused in other views. A common example is _form.html.erb which contains the basic form for a given resource. It is used in the new and in the edit view since creating something and editing something looks pretty similar.

