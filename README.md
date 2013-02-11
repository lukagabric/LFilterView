LFilterView
===========

In many projects there are requirements for some kind of check or radio lists. In order to simplify the process I’ve created a control that allows easy creation of different check and radio list components.

Classes overview
----------------
LFilterView - main view
LFilterElement - item data - title, subtitle, etc.
LFilterCell - item UI - binds data from LFilterElement

Examples
--------
(for more examples check the LFilterViewSample)

Example 1
=========

    LFilterSection *section = [LFilterSection new];
    
    for (int i = 1; i <= 15; i++)
    {
        LFilterElement *element = [LFilterElement new];
        element.title = [NSString stringWithFormat:@"Option %d", i];
        element.cellReuseIdentifier = @"LFilterCellReuseIdentifier";
        [section addElement:element];
    }
    
    [_filterView addSection:section];

Example 2
=========

    LFilterSection *section = [LFilterSection new];

    LTextElement *textElement = [LTextElement new];
    textElement.title = @"Radio group";
    [section addElement:textElement];
    
    LSpacingElement *spacingElement = [LSpacingElement new];
    spacingElement.rowHeight = 40;
    [section addElement:spacingElement];

    for (int i = 1; i <= 15; i++)
    {
        LFilterElement *element = [LFilterElement new];
        element.title = [NSString stringWithFormat:@"Option %d", i];
        element.cellReuseIdentifier = @"LFilterCellReuseIdentifier";
        [section addElement:element];
    }
    
    [_filterView addSection:section];


Integrating into your project as static library
-----------------------------------------------
1. clone the LFilterView git repository e.g. git clone git://github.com/lukagabric/LFilterView.git
2. add LFilterView.xcodeproj to your project, make sure "Copy items into ..." is unchecked
3. in your target's Build Phases, under Link Binary With Libraries, click on the (+) and add the libLFilterView.a library and CoreGraphics.framework.
4. add the relative path to the LFilterView headers in your "User Header Search Path" Build Setting
5. add -ObjC and -all_load to Other Linker Flags in your target's build settings
6. add LFilterView Resources to your project ../LFilterView/Resources

Screenshots:
------------
[![](http://lukagabric.com/wp-content/uploads/2013/02/filterview-custom.png)](http://lukagabric.com/wp-content/uploads/2013/02/filterview-custom.png)
[![](http://lukagabric.com/wp-content/uploads/2013/02/filterview-checkbox.png)](http://lukagabric.com/wp-content/uploads/2013/02/filterview-checkbox.png)
------------
