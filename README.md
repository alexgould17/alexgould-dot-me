# README

This readme serves as a detailed overview and, until site launch, a checklist of all the things that need to be done. Finished & tested line items will be marked with a ^ at the end. Implemented but not tested/work-in-progress items will be marked with a # at the end. Not yet touched upon items will be left blank. The purpose of this is to provide maximum transparency & showcase (honestly, mostly to myself) my workflow that it may be viewed, & improved upon where necessary. Also, I believe in putting things in writing & backing them up because it makes the responsibility much harder to escape, which, in turn, promotes accountability. Finally, I work much faster when I have a framework to guide me; especially so when I can read specific items off a checklist & just hammer those out. To put it in gaming terms, I'm a quest completer. Anything too sandbox-y overwhelms me fairly quickly. Give me concrete goals & I'll fight infinite super mutants to complete them. **If you can't find the info you need in this readme, please look at the source code. All the names of variables/methods/etc. should be intuitive & comments are placed where more clarification is needed!**

## General Checklist
- Update gemfile to include all needed gems & strip out unused ones.
- Pick colors & theme.
- Check W3C to ensure full accessibility.

## Files & Data

### Models
#### Blog
- title - string - The title of the post.
- hook - text - A brief overview and/or the first paragraph of the blogpost to hook people into reading it.
- created_at - timestamp - Time the post was created at.
- updated_at - timestamp - Time the post was last updated at.
- author - string - Name of the author of the post.
- body - text - The body text of the blogpost. *Formatted for display w/HTML*.

#### Project
- title - string - The title of the project.
- synopsis - text - A short overview of the project.
- description - text - An in-depth description of the project including overview, goals & technologies used. *Formatted for display w/HTML*.
- updated_at - timestamp - The last time the project's info was updated.
- site_link - string - The URL of the site where the project is running.
- source_link - string - The URL of the project's source code.
- screenshot_link - string - The URL of the picture showing a screenshot of the project.

### Views
- *framework* - app/views/layouts/application - n/a - The framing for each page. Has a navbar (dropdown?) with links to Landing (as Alex), About (as Bio), Thanks, Blog & Projects.
- Landing - app/views/home/index - / - HomeController - The main page. Shows a picture of me, my 10 second elevator pitch bio (links to detailed bio), contact info (with included email mini-form for resume request), and a list of my projects, each in a separate box with links to the project page.
- Bio - app/views/home/bio - /bio - HomeController - My bio. Has a more detailed description of me, my programming journey, my core beliefs, my interests outside of work (a box for each major hobby), and accompanying photos.
- Thanks - app/views/home/thanks - thanks - HomeController - A list of people, organizations & technologies I am thankful for in my journey in general & for helping me with this website in particular.
- Blog Main - app/views/blog/index - /blog - BlogController - My blogposts. Simply lists each one with the title & first-paragraph synopsis/hook in its own box with a link to go to the full post. Small header with a little blurb below it like "my random ramblings" or something to that effect.
- Blog Post - app/views/blog/post - /blog/#id -  BlogController - A blogpost. Just the title & post along with a timestamp and author name (which should probably always be me? Might leave that open just in case this grows & I want to have the freedom to have guests).
- Projects Main - app/views/project/index - /projects - ProjectController - A listing of all my projects. Each one should be in its own box with a title, short description, screenshot & link to project page.
- Project Page - app/views/project/page - /projects/#id - ProjectController - A more intimate look at a project. Title & pic, then a link to the hosted site & a link to the source code, followed by an in-depth description of what the project was, what the goals were, and what technologies were used in the project.

### Controllers
- HomeController - Controls the Landing, About & Thanks pages. Should have ajax for email submission of the resume request form.
- BlogController - Controls all the blog pages & pulls posts from the database accordingly. No permissions needed as only read/index options will be available on web view for this model (create/update/delete handled on backend until further notice).
- ProjectController - Controls all the project pages & pulls posts from the database accordingly. No permissions needed as only read/index options will be available on web view for this model (create/update/delete handled on backend until further notice).
