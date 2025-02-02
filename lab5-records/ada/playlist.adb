with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure PlayList is

    type Item_Variant is (SONG, PAUSE); -- Enumerated type for item variant

    type Person is record
        name : Unbounded_String;
    end record;

    procedure Put_Person (p : Person) is
    begin
        Put (To_String (p.name));
    end Put_Person;

    type Item is record
        name        : Unbounded_String;
        performer   : Person;
        length_secs : Float;
        item_variant: Item_Variant; -- Add variant field
    end record;

    procedure Put_Item (i : Item) is
    begin
        case i.item_variant is
            when SONG =>
                Put (To_String (i.name));
                Put (" by ");
                Put_Person (i.performer);
                Put (" (");
                Put (i.length_secs, aft => 1, exp => 0);
                Put_Line ("s)");
            when PAUSE =>
                Put (To_String (i.name));
                Put (" (");
                Put (i.length_secs, aft => 1, exp => 0);
                Put_Line ("s)");
        end case;
    end Put_Item;

    piece1 : Item :=
       (name        => To_Unbounded_String ("Moonlight Sonata"),
        performer   => (name => To_Unbounded_String ("Claudio Arrau")),
        length_secs => 17.0 * 60.0 + 26.0,
        item_variant => SONG -- Initialize variant field for piece1 as SONG
       );

    pause1 : Item :=
        (name        => To_Unbounded_String ("Pause"),
         performer   => (name => To_Unbounded_String ("")),
         length_secs => 5.0,
         item_variant => PAUSE -- Initialize variant field for pause1 as PAUSE
        );

begin
    Put_Item (piece1);
    Put_Line ("");
    Put_Item (pause1);
    Put_Line ("");
end PlayList;