public class MyApp : GtkApplication {

    public MyApp () {
        Object (
            application_id: "com.github.bunnyapocalypse.packagepractice",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var cool_button = new Gtk.Button.with_label (_("Clicky Clicky"));
        cool_button.margin = 5;
        cool_button.clicked.connect (() => {
            cool_button.label = _("No more clicky :(")
            cool_button.sensitive = false;
        });
        var main_window = new.Gtk.ApplicationWindow (this);
        main_window.default_height = 500;
        main_window.default_width = 300;
        main_window.title = _("What Could the Button Do?");
        main_window.add (cool_button);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
