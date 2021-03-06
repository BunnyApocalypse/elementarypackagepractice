/*
* Copyright (c) 2011-2018 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <bunnyapocalypse@protonmail.com>
*/
public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.bunnyapocalypse.packagepractice",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        
        var layout = new Gtk.Grid ();
        layout.column_spacing = 6;
        layout.row_spacing = 6;
        
        var hello_button = new Gtk.Button.with_label (_("Click me too!"));
        var hello_label = new Gtk.Label (null);
        
        var rotate_button = new Gtk.Button.with_label (_("Rotate"));
        var rotate_label = new Gtk.Label (_("Horizonal"));
        
        //Add first row of widgets
        layout.attach (hello_button, 0, 0, 1, 1);
        layout.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);
        
        //Add second row of widgets
        layout.attach (rotate_button, 0, 1, 1, 1);
        layout.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);
        
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 500;
        main_window.default_width = 300;
        main_window.title = _("Griddy");
        
        //Add layout grid
        main_window.add (layout);
        
        //Make buttons do things
        hello_button.clicked.connect (() => {
            hello_label.label = _("Hello World!");
            hello_button.sensitive = false;
        });
        
        rotate_button.clicked.connect (() => {
            rotate_label.angle = 90;
            rotate_label.label = _("vertical");
            rotate_button.sensitive = false;
        });
        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }

}
