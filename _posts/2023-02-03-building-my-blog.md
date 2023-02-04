---
layout: post
title:  "Building My Blog"
date:   2023-02-03 12:00:00 -0600
categories: blog
---
## On This Page
1. [Minimum Viable Product](#minimum-viable-product)
2. [Developing the Blog](#developing-the-blog)
    1. [Selecting an SSG](#selecting-an-ssg)
    2. [Setting up Jekyll](#setting-up-jekyll)
    3. [Selecting a Theme](#selecting-a-theme)
    4. [Hosting on GitHub Pages](#hosting-on-github-pages)
    5. [Adding LaTeX Support](#adding-latex-support)
    6. [Analytics](#analytics)
3. [Final Thoughts](#final-thoughts)

---

I have a *lot* of projects gathering dust in my project graveyard. Most of the time, my projects end up there not because they're bad ideas or lose value but because I let my imagination run free. I expand the project scope while working on it until what started as a small project becomes very, very large. Then I drop the project for something fun and faster to complete.

Rinse and repeat.

One project I've wanted to work on for a while is a blog where I can discuss what I have learned and show off recent projects. The blog has been in the graveyard for almost two years now.

So I'm going to try something new[^1]:
- Define a strict minimum viable product for my blog
- Estimate how long it will take to complete
- Try to develop it *as fast as possible*.

No scope expansions, embellishments, or cool features. **Just get the thing working.**

<details>
<summary><strong>Click here for the TL;DR.</strong></summary>
<!--<p style="background-color:#212121;border:2px solid;border-color:#404040;">-->
With almost zero prior web experience, I created a blog that is responsive to changes in display size, supports code segments, images, footnotes, and LaTeX typesetting, and is not built with a drag-and-drop editor like Wix or Squarespace. The site is generated locally using Jekyll and hosted on GitHub. LaTeX is rendered with the KaTeX Jekyll plugin. From start to finish, the site took about 5 hours and 17 minutes.
<br><br>
Challenging myself to complete the project as fast as possible was a success, and I will probably try it again.
<!--</p>-->
</details>

## Minimum Viable Product
Before doing anything else, I need to specify what features my site should have. I did a little thinking and came up with some simple requirements:
1. Accessible through my custom domain
2. Have an about me page and a blog. I can add a project page later.
3. Be responsive to changes in display size.
4. Be easy to add pages and blog posts to
5. Support code segments, images, footnotes, and LaTeX typesetting.
6. Provide analytics for page views, but dot not feel creepy (looking at you, Google Analytics!)
7. Not be built with a drag-and-drop editor like Wix, Squarespace, etc. 

I have no web development experience and only enough software experience to be a reasonable kitty-scripter, which is a long way of saying I have *no idea* what I'm doing. I will choose a random number for how long I expect this will take me.. 10 hours. That's the goal: Build a blog as quickly as possible, ideally beating my 10-hour expectation.
  
Let's get started.

## Developing the Blog
### Selecting an SSG
If I don't want to use a drag-and-drop website builder like Wix, then I think I only have two choices:
1. Build my site from scratch by explicitly writing HTML, CSS, and JS
2. Use a static site generator (SSG) to transform markdown into HTML, CSS, and JS

I would usually select the first approach because it appeals to my hacky interests, but I can't this time. With my web experience, building my site from scratch would take *way* too long. Not to mention it would probably be difficult to maintain. An SSG is the way to go.

Which static site generator should I use? There are many options, such as [Hexo][hexo-link], [Zola][zola-link], and [Hugo][hugo-link], to name a few, but I'm choosing to use [Jekyll][jekyll-link]. It's (apparently) not as fast as other options and unfortunately requires a Ruby environment to run, but it has been around forever, has many online resources, and is supported by GitHub Pages. I can make speed issues a problem for future me. Plus, if I run `ruby -v` in my terminal, it looks like I already have Ruby on my Mac! 

### Setting up Jekyll
Setting up Jekyll looks easy. Start by installing it via `gem install jekyll bundler`, and the- Wait, that didn't work.

The Ruby environment bundled in macOS is meant for the system, not the user. Without using `sudo`, I can't install gems using the system environment. Further, while using `sudo` may work, everyone says not to do it because you can mess up the system environment. This seems like good advice.

Fortunately, I found a [helpful guide][ruby-instr-link] maintained by Moncef Belyamani that walks through setting up and managing versions of Ruby on macOS. He also has a tool that claims to do everything for you, but I found the website plenty helpful.

Now `gem install jekyll bundler` works, and I can create a new temporary blog using `jekyll new temp_blog`. To serve it, I run `bundle exec jekyll serve`. It works!

According to my notes, it has taken about 47 minutes[^2] to get to this point. I spent most of that time was spent realizing I shouldn't use system Ruby, setting up a different Ruby environment, and fixing odd homebrew issues. Not bad.

### Selecting a Theme
After some Googling and consideration, I decided to stick with the Minima theme for my page. There are plenty of other clean and simple themes to select from, but Minima is the default one used by new Jekyll projects and does almost exactly what I want out of the box. The only modification I want to make is in `_config.yml`, where I instruct Minima to use the default dark skin.

{% highlight yaml %}
...
minima: 
  skin: dark
...
{% endhighlight %}

And that's it. My blog has a clean, dark skin. I may change it in the future, but that's not important for getting this project done.

### Hosting on GitHub Pages
Hosting my site on GitHub Pages is a no-brainer; it's free, and I already use GitHub. The real question is whether I should take advantage of GitHub's Jekyll support and make GitHub build my site for me. Having GitHub build the site for me is simpler and means I don't need a Ruby environment to make future changes to my site from other devices, but it has the drawback that some plugins might not work. I don't know if LaTeX rendering will work on GitHub Pages.

For the moment, I will use GitHub to host and build my site so I can connect my custom domain name and get that working. It doesn't take much time to create a new `xxx.github.io` repository, clone it, run `jekyll new .` in that repository, and push. Because I already have a domain name, all I need to do is follow GitHub's [documentation][github-domain-documentation-link] on configuring it.

One problem: My theme isn't right. The version of Minima used by GitHub Pages does not support skins, so I need to instruct GitHub Pages to download the latest version. That's just a one-liner in the `_config.yml` file, fortunately. 

{% highlight yaml %}
...
remote_theme: jekyll/minima # Force download updated minima theme. Default minima that GitHub uses is out of date. Fix suggested from: https://stackoverflow.com/questions/68518590/does-minima-dark-skin-work-on-github-pages
minima: 
  skin: dark
...
{% endhighlight %}

With some additional messing around with my domain settings, it works! For the first time in two years, [dougz.info][dougz-link] is finally beginning to look like something I can use!

To go from a local webserver to viewing my site through my custom domain has taken about 1 hour and 48 minutes of on-and-off work. According to my notes, I most of this time was spent messing with my custom domain, getting it pointed to GitHub properly, and correcting the theme issue.

### Adding LaTeX Support
To render LaTeX on my site, I need to add a JS library like MathJax or [KaTeX][katex-link]. Both libraries should work, but I'll go with KaTeX because it claims to render faster and is easy to implement in just three steps. 

Surprisingly, this just worked out of the box! Here's an example of rendering LaTeX both in-line and in display mode.

> {% katexmm %}
> This is a test of rendering LaTeX using the KaTeX library. I frequently find it useful to explain the math behind a design, which necessitates writing expressions in-line (e.g., $A_{V}\approx-g_m/g_o$). Sometimes, expressions are more complex and benefit from being written in their own line (display mode):

> $$V_{DC} = 2\left[V_m\frac{C_2}{C_2+C_S}-V_D\right] - \frac{2I_L}{f_0\left(C_C+C_S\right)}$$

> Wrapping my paragraph with {% raw %} `{% katexmm %}` and `{% endkatexmm %}` {% endraw %} makes embedding LaTeX in text very easy.
> {% endkatexmm %}


However, as soon as I push this to GitHub Pages, it stops working. As anticipated, GitHub Pages' Jekyll build doesn't support the KaTeX plugin. To use KaTeX on my site, I will need to upload the contents of `_site` directly to GitHub Pages and serve that content.

The solution:
1. Create a `gh-pages` branch in the repository.
2. serve my site from that repo.
3. Push the contents of `_site` to that branch.

I can push everything else to the main branch since it is not serving my site[^3].

Copying the contents of `_site` and pushing to two branches every time I want to make a change would be a nuisance. Fortunately, in my Googling, I learned about pre-push and pre-commit hooks. With some small modifications of the script presented [here][pre-push-link], I made a pre-push hook that automatically pushes the contents of `_site` to `gh-pages` anytime I push to the main branch. Here's my modified script:

{% highlight shell %}
# Enable the extglob shell option so I can use rm !(file)
shopt -s extglob
# If any command fails in the below script, exit with error
set -e

temp_folder="._temp"

# Make sure our main code runs only if we push the main branch
if [ "$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)" == "main" ]; then
    # Store the last commit message from main branch
    last_message=$(git show -s --format=%s main)

    # Build our Jekyll site
    bundle exec jekyll build

    # Move the generated site in our temp folder
    mv ./_site ./${temp_folder}
    # Also move CNAME into the temp folder
    cp ./CNAME ./${temp_folder}
    # Checkout the gh-pages branch and clean it's contents. Don't delete temp_folder.
    git checkout gh-pages
    rm -rf !("${temp_folder}")

    # Copy the site content from the temp folder and remove the temp folder
    cp -r ./${temp_folder}/* .
    rm -rf ./${temp_folder}

    # Commit and push our generated site to GitHub
    git add -A
    git commit -m "Built \`$last_message\`"
    git push

    # Go back to the main branch
    git checkout main
    exit 0
else
    echo "Not main branch. Skipping build"
fi
{% endhighlight %}

The original hook would have worked just as well, but I didn't like that it operated in the parent directory[^4]. My hook differs in that it utilizes a temporary folder in the repository, ignored by git (thanks `.gitignore`), as the swap directory. Also, I copy over `CNAME` to maintain my custom domain name settings and return 0 on exit so the push to `main` goes through.

### Analytics
For analytics, I am using [GoatCounter][goat-counter-link] because it is easy to implement, free (but accepts donations), open-source, and seems less intrusive than Google Analytics.

## Final Thoughts
I need to make many adjustments before I'll be happy with how [dougz.info][dougz-link] works and feels. The color scheme, especially, needs attention. However, the site *actually* exists now, which is more than I could say before. Whether I will use it in the future is yet to be seen.

According to my notes, I took 3 hours and 47 minutes to get the site running per my defined requirements. It is more realistic to say that it took me an hour and a half longer than my notes stated (5 hours and 17 minutes) because I forgot to track my time in some situations, such as when reading on the bus.

Writing firm requirements for the first revision of the blog, and then challenging myself to develop it as quickly as possible, was a very successful exercise. I may do it again in the future for other small projects.

---

[hexo-link]: https://hexo.io/
[zola-link]: https://www.getzola.org/
[hugo-link]: https://gohugo.io/
[jekyll-link]: https://jekyllrb.com/
[ruby-instr-link]: https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/?utm_source=stackoverflow&utm_campaign=51126403
[github-domain-documentation-link]: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
[dougz-link]: https://dougz.info/
[katex-link]: https://github.com/linjer/jekyll-katex
[pre-push-link]: https://surdu.me/2020/02/04/jekyll-git-hook.html
[goat-counter-link]: https://www.goatcounter.com/

[^1]: New to me. Obvious to most people.
[^2]: Not including when my laptop downloaded dependencies and I was scrolling Reddit.
[^3]: I have no reason to *actually* use Git properly. 
[^4]: At some point when testing, I messed up and the hook started copying all of `~` into my repository. That scared me a lot - what if `rm` had run in `~` instead of `cp`? After that, I decided I wasn't OK with the hook running outside my repository directory.
