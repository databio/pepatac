---
layout: default
title: Contact
permalink: /contact/
tags: nav
---
<div class="container">
  <div id="intro">
    <p></p>
    <h2>Contact Us!</h2>
    <p>Have a question? Just want to get in touch? Reach out to us here!</p>
  </div><!-- /.intro -->
  <form id="contact-form" name="contact-form" method="POST" action="https://formspree.io/pepatac@gmail.com">
    <div class="messages"></div>
      <div class="controls">
        <div class="form-row align-items-center">
          <div class="col-sm-3 my-1">
            <div class="form-group">
              <label for="firstName">First name</label>
              <input type="text" name="firstName" class="form-control" id="firstName" aria-describedby="firstNameHelp" placeholder="First" required="required">
              <small id="firstNameHelp" class="form-text text-muted"></small>
              <div class="help-block with-errors"></div>
            </div>
          </div>
          <div class="col-sm-3 my-2">
            <div class="form-group">
              <label for="lastName">Last name</label>
              <input type="text" name="lastName" class="form-control" id="lastName" aria-describedby="lastNameHelp" placeholder="Last" required="required">
              <small id="lastNameHelp" class="form-text text-muted"></small>
              <div class="help-block with-errors"></div>
            </div>
          </div>
          <div class="col-sm-3 my-3">
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Please enter your email" required="required">
              <small id="emailHelp" class="form-text text-muted"></small>
              <div class="help-block with-errors"></div>
            </div>
          </div>
        </div>
          <!-- <div class="form-row"> -->
        <div class="form-group">
          <label for="message">Message</label>
          <textarea class="form-control" name="message" id="message" placeholder="Enter a question or comment" required="required" rows="3"></textarea>
          <div class="help-block with-errors"></div>
        </div>
        <!-- </div> -->
        <!-- <div class="form-row align-items-center">
          <div class="form-group">
            <div class="custom-file">
              <input type="file" name="customFile" class="custom-file-input" id="customFile">
              <label class="custom-file-label" for="customFile">Choose file</label>
              <div class="help-block with-errors"></div>
            </div>
          </div>
        </div> -->
        <div class="form-row align-items-center">	
          <div class="form-group">
            <button type="submit" class="btn btn-secondary btn-send">Send message</button>
          </div>
        </div>
      </div>
    <input type="hidden" name="_next" value="{{ "/thanks/" | prepend: site.baseurl }}" />
  </form>
</div>