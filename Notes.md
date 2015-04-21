students don't have to be deleteable, but they should:
- be shown to be 'active' or 'inactive' (set by the Admin)
- when inactive, the user can't access anything (except be able to (only) delete (not edit) their Testimonial)
- Students who aren't assigned to classes should be flagged (then admin can check if they should be made inactive). When a class is deleted, it may be the case that a student's student.groups becomes 'nil' automatically - this could automatically set them to have the status of having no class.

User can only leave a testimonial if they are a Student? i.e. user.type == "Student" (saves sacked teachers leaving spam on public page)
NB: Testimonials are indexed on student_id, so I think a testimonial will not be able to be saved if they're not a student. However, might be a tidier user-experience to code controller filters instead too.
UPDATE: testimonials/new can now only be accessed by a signed-in user who is also a student.

Unassigned users can't do anything (especially not write testimonials [could lead to spam, and provides an opportunity to moderate signed-up users])

Admin should be able to assign (and unassign) any other user as an admin.

-- Should be a flag when a student isn't assigned to a class and when a class doesn't have a teacher.


Admin Materials page essential.
Teachers should be able to get to that page and POST those ones onto their own materials page. But if Admin changes the links, you get dead links on the Teacher's materials page.
Solution: Teacher's materials page PULLS present posts from Admin materials page. Teacher could select one to also belong to their materials.
One solution would be to just have an AdminMaterials page, but have materials selectable to belong to Teachers maybe? I think would be a HABTM association?

ANOTHER POSSIBLE SOLUTION: one Materials table. Material HABTM :users. User HABTM :materials. materials_users join table. Maybe not, actually...

I think I need a belongs_to and a HABTM on the same model (Materials model). This could be a solution:
http://stackoverflow.com/questions/13959955/belongs-to-and-has-and-belongs-to-many-to-the-same-table-in-rails

Goudy Text Family

========================================================
When a User is a Teacher and is assigned to a class, when you re-assign them to be a Student instead, they are not longer listed as being in that class, but when you assign them back to being a Teacher, they are shown as still being in that class. Bug? Dead database data when reassigning a User from a Teacher to a Student (and vice-versa?)?
========================================================