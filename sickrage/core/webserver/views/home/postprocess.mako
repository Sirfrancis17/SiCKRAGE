<%inherit file="../layouts/main.mako"/>
<%!
    import sickrage
%>
<%block name="content">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <div class="sickrage-card m-1">
                <div class="sickrage-card-header">
                    <h3 class="title">${title}</h3>
                </div>
                <div class="card-body">
                    <form name="processForm" method="post" action="processEpisode" style="line-height: 40px;">
                        <input type="hidden" id="type" name="proc_type" value="manual">
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Enter the folder containing the episode')}</b>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><span class="fas fa-folder-open"></span></span>
                                    </div>
                                    <input name="proc_dir" id="episodeDir" class="form-control" autocapitalize="off"
                                           value="${sickrage.app.config.tv_download_dir}" title="directory"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Process Method to be used:')}</b>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><span class="fas fa-sync"></span></span>
                                    </div>
                                    <select name="process_method" id="process_method"
                                            title="Choose post-processing method"
                                            class="form-control form-control-inline input-sm">
                                        <% process_method_text = {'copy': _("Copy"), 'move': _("Move"), 'hardlink': _("Hard Link"), 'symlink' : _("Symbolic Link"),'symlink_reversed' : _("Symbolic Link Reversed")} %>
                                        % for curAction in process_method_text:
                                            <option value="${curAction}" ${('', 'selected')[sickrage.app.config.process_method == curAction]}>${process_method_text[curAction]}</option>
                                        % endfor
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Force already Post Processed Dir/Files:')}</b>
                            </div>
                            <div class="col-md-6">
                                <input id="force" name="force" type="checkbox" title="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Mark Dir/Files as priority download:')}</b>
                            </div>
                            <div class="col-md-6">
                                <input id="is_priority" name="is_priority" type="checkbox" title="">
                                <span style="line-height: 0; font-size: 12px;">
                            <i>${_('(Check it to replace the file even if it exists at higher quality)')}</i>
                        </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Delete files and folders:')}</b>
                            </div>
                            <div class="col-md-6">
                                <input id="delete_on" name="delete_on" type="checkbox" title="">
                                <span style="line-height: 0; font-size: 12px;">
                            <i>${_('(Check it to delete files and folders like auto processing)')}</i>
                        </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Don\'t use processing queue:')}</b>
                            </div>
                            <div class="col-md-6">
                                <input id="force_next" name="force_next" type="checkbox" title="">
                                <span style="line-height: 0; font-size: 12px;">
                            <i>${_('(Check it to return the result of the process here, but may be slow!)')}</i>
                        </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>${_('Mark download as failed:')}</b>
                            </div>
                            <div class="col-md-6">
                                <input id="failed" name="failed" type="checkbox" title="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <input id="submit" class="sickrage-btn" type="submit" value="${_('Process')}"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</%block>
