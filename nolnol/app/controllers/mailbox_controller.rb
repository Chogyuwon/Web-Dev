class MailboxController < ApplicationController
	before_action :authenticate_user!

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
		unless !user_signed_in?
    	@followedall = current_user.followers.all
    	@followingall = current_user.followings.all
    end
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end

end
