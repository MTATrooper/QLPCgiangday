namespace QLPCgiangday.GUI
{
    partial class ucImportTTMT
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
            this.dataPC_TTMT = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_TTMT)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_TTMT
            // 
            this.dataPC_TTMT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_TTMT.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_TTMT.Location = new System.Drawing.Point(0, 0);
            this.dataPC_TTMT.Name = "dataPC_TTMT";
            this.dataPC_TTMT.Size = new System.Drawing.Size(860, 412);
            this.dataPC_TTMT.TabIndex = 2;
            // 
            // ucImportTTMT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_TTMT);
            this.Name = "ucImportTTMT";
            this.Size = new System.Drawing.Size(860, 412);
            this.Load += new System.EventHandler(this.ucImportTTMT_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_TTMT)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_TTMT;
    }
}
