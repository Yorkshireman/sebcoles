students don't have to be deleteable, but they should:
- be shown to be 'active' or 'inactive' (set by the Admin)
- when inactive, the user can't access anything (except be able to (only) delete (not edit) their Testimonial)
- Students who aren't assigned to classes should be flagged (then admin can check if they should be made inactive). When a class is deleted, it may be the case that a student's student.groups becomes 'nil' automatically - this could automatically set them to have the status of having no class.

User can only leave a testimonial if they are a Student? i.e. user.type == "Student" (saves sacked teachers leaving spam on public page)
NB: Testimonials are indexed on student_id, so I think a testimonial will not be able to be saved if they're not a student. However, might be a tidier user-experience to code controller filters instead too.

Unassigned users can't do anything (especially not write testimonials [could lead to spam, and provides an opportunity to moderate signed-up users])

Admin should be able to assign (and unassign) any other user as an admin.