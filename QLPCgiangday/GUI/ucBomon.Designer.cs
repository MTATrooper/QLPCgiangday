namespace QLPCgiangday.GUI
{
    partial class ucBomon
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnHuyBM = new DevExpress.XtraEditors.SimpleButton();
            this.btnLuuBM = new DevExpress.XtraEditors.SimpleButton();
            this.btnXoaBM = new DevExpress.XtraEditors.SimpleButton();
            this.btnSuaBM = new DevExpress.XtraEditors.SimpleButton();
            this.labelControl4 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl3 = new DevExpress.XtraEditors.LabelControl();
            this.txtSOGV = new DevExpress.XtraEditors.TextEdit();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.txtTENBM = new DevExpress.XtraEditors.TextEdit();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.btnThemBM = new DevExpress.XtraEditors.SimpleButton();
            this.txtMABM = new DevExpress.XtraEditors.TextEdit();
            this.panelControl1 = new DevExpress.XtraEditors.PanelControl();
            this.btnsearch = new DevExpress.XtraEditors.SimpleButton();
            this.txtsearch = new DevExpress.XtraEditors.TextEdit();
            this.cbBsearch = new DevExpress.XtraEditors.ComboBoxEdit();
            this.labelControl5 = new DevExpress.XtraEditors.LabelControl();
            this.dataBomon = new System.Windows.Forms.DataGridView();
            this.STT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MABM = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TENBM = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SOGV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MAChunhiem = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cbBCN = new System.Windows.Forms.ComboBox();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtSOGV.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtTENBM.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMABM.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtsearch.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbBsearch.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataBomon)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.cbBCN);
            this.groupBox1.Controls.Add(this.btnHuyBM);
            this.groupBox1.Controls.Add(this.btnLuuBM);
            this.groupBox1.Controls.Add(this.btnXoaBM);
            this.groupBox1.Controls.Add(this.btnSuaBM);
            this.groupBox1.Controls.Add(this.labelControl4);
            this.groupBox1.Controls.Add(this.labelControl3);
            this.groupBox1.Controls.Add(this.txtSOGV);
            this.groupBox1.Controls.Add(this.labelControl2);
            this.groupBox1.Controls.Add(this.txtTENBM);
            this.groupBox1.Controls.Add(this.labelControl1);
            this.groupBox1.Controls.Add(this.btnThemBM);
            this.groupBox1.Controls.Add(this.txtMABM);
            this.groupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(101, 85);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(391, 394);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Bộ môn";
            // 
            // btnHuyBM
            // 
            this.btnHuyBM.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnHuyBM.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuyBM.Image = global::QLPCgiangday.Properties.Resources.remove;
            this.btnHuyBM.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnHuyBM.Location = new System.Drawing.Point(218, 317);
            this.btnHuyBM.Name = "btnHuyBM";
            this.btnHuyBM.Size = new System.Drawing.Size(75, 51);
            this.btnHuyBM.TabIndex = 25;
            this.btnHuyBM.Text = "Hủy";
            this.btnHuyBM.Click += new System.EventHandler(this.btnHuyBM_Click);
            // 
            // btnLuuBM
            // 
            this.btnLuuBM.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnLuuBM.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuuBM.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuuBM.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuuBM.Location = new System.Drawing.Point(103, 317);
            this.btnLuuBM.Name = "btnLuuBM";
            this.btnLuuBM.Size = new System.Drawing.Size(75, 51);
            this.btnLuuBM.TabIndex = 24;
            this.btnLuuBM.Text = "Lưu";
            this.btnLuuBM.Click += new System.EventHandler(this.btnLuuBM_Click);
            // 
            // btnXoaBM
            // 
            this.btnXoaBM.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnXoaBM.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoaBM.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoaBM.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoaBM.Location = new System.Drawing.Point(281, 245);
            this.btnXoaBM.Name = "btnXoaBM";
            this.btnXoaBM.Size = new System.Drawing.Size(75, 51);
            this.btnXoaBM.TabIndex = 23;
            this.btnXoaBM.Text = "Xóa";
            this.btnXoaBM.Click += new System.EventHandler(this.btnXoaBM_Click);
            // 
            // btnSuaBM
            // 
            this.btnSuaBM.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaBM.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnSuaBM.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSuaBM.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaBM.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSuaBM.Location = new System.Drawing.Point(150, 245);
            this.btnSuaBM.Name = "btnSuaBM";
            this.btnSuaBM.Size = new System.Drawing.Size(75, 51);
            this.btnSuaBM.TabIndex = 22;
            this.btnSuaBM.Text = "Sửa";
            this.btnSuaBM.Click += new System.EventHandler(this.btnSuaBM_Click);
            // 
            // labelControl4
            // 
            this.labelControl4.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl4.Location = new System.Drawing.Point(49, 179);
            this.labelControl4.Name = "labelControl4";
            this.labelControl4.Size = new System.Drawing.Size(76, 19);
            this.labelControl4.TabIndex = 21;
            this.labelControl4.Text = "Chủ nhiệm:";
            // 
            // labelControl3
            // 
            this.labelControl3.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl3.Location = new System.Drawing.Point(49, 133);
            this.labelControl3.Name = "labelControl3";
            this.labelControl3.Size = new System.Drawing.Size(86, 19);
            this.labelControl3.TabIndex = 19;
            this.labelControl3.Text = "Số giáo viên:";
            // 
            // txtSOGV
            // 
            this.txtSOGV.Location = new System.Drawing.Point(159, 130);
            this.txtSOGV.Name = "txtSOGV";
            this.txtSOGV.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSOGV.Properties.Appearance.Options.UseFont = true;
            this.txtSOGV.Size = new System.Drawing.Size(186, 26);
            this.txtSOGV.TabIndex = 18;
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(49, 86);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(83, 19);
            this.labelControl2.TabIndex = 17;
            this.labelControl2.Text = "Tên bộ môn:";
            // 
            // txtTENBM
            // 
            this.txtTENBM.Location = new System.Drawing.Point(159, 83);
            this.txtTENBM.Name = "txtTENBM";
            this.txtTENBM.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTENBM.Properties.Appearance.Options.UseFont = true;
            this.txtTENBM.Size = new System.Drawing.Size(186, 26);
            this.txtTENBM.TabIndex = 16;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Location = new System.Drawing.Point(49, 40);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(81, 19);
            this.labelControl1.TabIndex = 15;
            this.labelControl1.Text = "Mã bộ môn:";
            // 
            // btnThemBM
            // 
            this.btnThemBM.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemBM.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThemBM.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnThemBM.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemBM.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemBM.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThemBM.Location = new System.Drawing.Point(33, 245);
            this.btnThemBM.Name = "btnThemBM";
            this.btnThemBM.Size = new System.Drawing.Size(75, 51);
            this.btnThemBM.TabIndex = 14;
            this.btnThemBM.Text = "Thêm";
            this.btnThemBM.Click += new System.EventHandler(this.btnThemBM_Click);
            // 
            // txtMABM
            // 
            this.txtMABM.Location = new System.Drawing.Point(159, 37);
            this.txtMABM.Name = "txtMABM";
            this.txtMABM.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMABM.Properties.Appearance.Options.UseFont = true;
            this.txtMABM.Size = new System.Drawing.Size(186, 26);
            this.txtMABM.TabIndex = 13;
            // 
            // panelControl1
            // 
            this.panelControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.panelControl1.Controls.Add(this.btnsearch);
            this.panelControl1.Controls.Add(this.txtsearch);
            this.panelControl1.Controls.Add(this.cbBsearch);
            this.panelControl1.Controls.Add(this.labelControl5);
            this.panelControl1.Controls.Add(this.dataBomon);
            this.panelControl1.Location = new System.Drawing.Point(568, 97);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(612, 372);
            this.panelControl1.TabIndex = 1;
            // 
            // btnsearch
            // 
            this.btnsearch.Image = global::QLPCgiangday.Properties.Resources.find;
            this.btnsearch.ImageLocation = DevExpress.XtraEditors.ImageLocation.MiddleCenter;
            this.btnsearch.Location = new System.Drawing.Point(444, 61);
            this.btnsearch.Name = "btnsearch";
            this.btnsearch.Size = new System.Drawing.Size(31, 23);
            this.btnsearch.TabIndex = 4;
            this.btnsearch.Click += new System.EventHandler(this.btnsearch_Click);
            // 
            // txtsearch
            // 
            this.txtsearch.Location = new System.Drawing.Point(286, 62);
            this.txtsearch.Name = "txtsearch";
            this.txtsearch.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtsearch.Properties.Appearance.Options.UseFont = true;
            this.txtsearch.Size = new System.Drawing.Size(142, 20);
            this.txtsearch.TabIndex = 3;
            this.txtsearch.TextChanged += new System.EventHandler(this.txtsearch_TextChanged);
            // 
            // cbBsearch
            // 
            this.cbBsearch.EditValue = "Mã bộ môn";
            this.cbBsearch.Location = new System.Drawing.Point(165, 62);
            this.cbBsearch.Name = "cbBsearch";
            this.cbBsearch.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.cbBsearch.Properties.Items.AddRange(new object[] {
            "Mã bộ môn",
            "Tên bộ môn"});
            this.cbBsearch.Size = new System.Drawing.Size(100, 20);
            this.cbBsearch.TabIndex = 2;
            // 
            // labelControl5
            // 
            this.labelControl5.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl5.Location = new System.Drawing.Point(104, 63);
            this.labelControl5.Name = "labelControl5";
            this.labelControl5.Size = new System.Drawing.Size(53, 16);
            this.labelControl5.TabIndex = 1;
            this.labelControl5.Text = "Tìm kiếm";
            // 
            // dataBomon
            // 
            this.dataBomon.AllowUserToAddRows = false;
            this.dataBomon.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataBomon.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.STT,
            this.MABM,
            this.TENBM,
            this.SOGV,
            this.MAChunhiem});
            this.dataBomon.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dataBomon.Location = new System.Drawing.Point(0, 149);
            this.dataBomon.Name = "dataBomon";
            this.dataBomon.Size = new System.Drawing.Size(612, 223);
            this.dataBomon.TabIndex = 0;
            this.dataBomon.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataBomon_CellClick);
            this.dataBomon.RowPrePaint += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(this.dataBomon_RowPrePaint);
            this.dataBomon.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataBomon_KeyDown);
            this.dataBomon.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataBomon_KeyDown);
            // 
            // STT
            // 
            this.STT.HeaderText = "STT";
            this.STT.Name = "STT";
            this.STT.Width = 40;
            // 
            // MABM
            // 
            this.MABM.DataPropertyName = "MABM";
            this.MABM.HeaderText = "Mã bộ môn";
            this.MABM.Name = "MABM";
            this.MABM.Width = 80;
            // 
            // TENBM
            // 
            this.TENBM.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.TENBM.DataPropertyName = "TENBM";
            this.TENBM.HeaderText = "Tên bộ môn";
            this.TENBM.Name = "TENBM";
            // 
            // SOGV
            // 
            this.SOGV.DataPropertyName = "SOGV";
            this.SOGV.HeaderText = "Số giáo viên";
            this.SOGV.Name = "SOGV";
            this.SOGV.Width = 60;
            // 
            // MAChunhiem
            // 
            this.MAChunhiem.DataPropertyName = "MAChunhiem";
            this.MAChunhiem.HeaderText = "Mã chủ nhiệm";
            this.MAChunhiem.Name = "MAChunhiem";
            this.MAChunhiem.Width = 60;
            // 
            // cbBCN
            // 
            this.cbBCN.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBCN.FormattingEnabled = true;
            this.cbBCN.Location = new System.Drawing.Point(159, 176);
            this.cbBCN.Name = "cbBCN";
            this.cbBCN.Size = new System.Drawing.Size(186, 27);
            this.cbBCN.TabIndex = 26;
            // 
            // ucBomon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.Controls.Add(this.panelControl1);
            this.Controls.Add(this.groupBox1);
            this.Name = "ucBomon";
            this.Size = new System.Drawing.Size(1201, 523);
            this.Load += new System.EventHandler(this.ucBomon_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtSOGV.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtTENBM.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMABM.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            this.panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtsearch.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbBsearch.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataBomon)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private DevExpress.XtraEditors.SimpleButton btnHuyBM;
        private DevExpress.XtraEditors.SimpleButton btnLuuBM;
        private DevExpress.XtraEditors.SimpleButton btnXoaBM;
        private DevExpress.XtraEditors.SimpleButton btnSuaBM;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.TextEdit txtSOGV;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.TextEdit txtTENBM;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnThemBM;
        private DevExpress.XtraEditors.TextEdit txtMABM;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.SimpleButton btnsearch;
        private DevExpress.XtraEditors.TextEdit txtsearch;
        private DevExpress.XtraEditors.ComboBoxEdit cbBsearch;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private System.Windows.Forms.DataGridView dataBomon;
        private System.Windows.Forms.DataGridViewTextBoxColumn STT;
        private System.Windows.Forms.DataGridViewTextBoxColumn MABM;
        private System.Windows.Forms.DataGridViewTextBoxColumn TENBM;
        private System.Windows.Forms.DataGridViewTextBoxColumn SOGV;
        private System.Windows.Forms.DataGridViewTextBoxColumn MAChunhiem;
        private System.Windows.Forms.ComboBox cbBCN;
    }
}
